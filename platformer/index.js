'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var chalk = require('chalk');

module.exports = yeoman.generators.Base.extend({
    init: function init() {
        this.pkg = require('../package.json');
        this.config.loadConfig();
    },

    askFor: function askFor() {
        var done = this.async();

        var prompts = [{
            type: 'input',
            name: 'appname',
            message: 'What is the name of your game?',
            default: this.config.get('appname') || this.appname
        },{
            type: 'input',
            name: 'company',
            message: 'What is the name of your game company?',
            default: this.config.get('company') || "Example Company"
        }];

        this.prompt(prompts, function (props) {
            this._.each(prompts, function(prompt) {
                this.config.set(prompt.name, this[prompt.name] = props[prompt.name]);
            }.bind(this));

            done();
        }.bind(this));
    },

    config: function config() {
        this.appTitle = this.config;
        this.packageName = ["com", this.company, this.appTitle].join('.');
    },

    src: function src() {
        this.directory('src');
        this.mkdir('src/entities');
    },

    assets: function assets() {
        this.directory('assets/audio');
        this.directory('assets/font');
        this.directory('assets/gfx');
    },

    projectfiles: function projectfiles() {
        this.copy('_.editorconfig', '.editorconfig');
        this.template('_project.xml', 'project.xml');
    }
});
