'use strict';
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.Base.extend({
    init: function init() {
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
        this.appTitle = this._.titleize(this.config.get('appname'));
        this.packageName = [
            "com",
            this._.classify(this.company).toLowerCase(),
            this._.classify(this.appTitle).toLowerCase()
        ].join('.');
    },

    src: function src() {
        this.directory('src');
        this.mkdir('src/entities');
    },

    assets: function assets() {
        this.directory('assets');
    },

    projectfiles: function projectfiles() {
        this.copy('_.editorconfig', '.editorconfig');
        this.template('_project.xml', 'project.xml');
    }
});