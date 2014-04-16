'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var chalk = require('chalk');

var HaxepunkGenerator = yeoman.generators.Base.extend({
    init: function init() {
        var _self = this;
        _self.pkg = require('../package.json');
    },

    askFor: function askFor() {
        var _self = this,
            done = _self.async();

        // have Yeoman greet the user
        _self.log(_self.yeoman);

        // replace it with a short and sweet description of your generator
        _self.log(chalk.magenta('You\'re using the fantastic Haxepunk generator.'));

        var prompts = [{
            type: 'input',
            name: 'company',
            message: 'What is the name of your game company?',
            default: true
        }];

        _self.prompt(prompts, function prompts(props) {
            _self.company = props.company;
            _self.appTitle = _self._.titleize(_self.appname);

            _self.packageName = [
                'com',
                _self._.classify(_self.company),
                _self._.classify(_self.appname)
            ].join('.');

            done();
        });
    },

    src: function src() {
        var _self = this;

        _self.directory('src');
        _self.mkdir('src/entities');
    },

    assets: function assets() {
        var _self = this;

        _self.mkdir('assets/audio');
        _self.mkdir('assets/font');
        _self.mkdir('assets/gfx');
    },

    projectfiles: function projectfiles() {
        var _self = this;

        _self.copy('_.editorconfig', '.editorconfig');
        _self.template('_project.xml', 'project.xml');
    }
});

module.exports = HaxepunkGenerator;
