'use strict';
var yeoman = require('yeoman-generator');
var path = require('path');

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
        this._templateDirectory('src');
        this.mkdir('src/entities');
    },

    assets: function assets() {
        this.directory('assets');
    },

    projectfiles: function projectfiles() {
        this.copy('_.editorconfig', '.editorconfig');
        this.template('_project.xml', 'project.xml');
    },

    _templateDirectory: function _templateDirectory(source, destination) {
        destination = destination || source;
        var root = this.isPathAbsolute(source) ? source : path.join(this.sourceRoot(), source);
        var files = this.expandFiles('**', { dot: true, cwd: root });

        for (var i = 0; i < files.length; i++) {
            var f = files[i];
            var src = path.join(root, f);
            if(path.basename(f).indexOf('_') == 0){
                var dest = path.join(destination, path.dirname(f), path.basename(f).replace(/^_/, ''));
                this.template(src, dest);
            }
            else{
                var dest = path.join(destination, f);
                this.copy(src, dest);
            }
        }
    }
});
