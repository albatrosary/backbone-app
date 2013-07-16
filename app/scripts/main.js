/*global require*/
'use strict';

require.config({
    shim: {
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: [
                'underscore',
                'jquery'
            ],
            exports: 'Backbone'
        },
    },
    paths: {
        jquery: '../bower_components/jquery/jquery',
        backbone: '../bower_components/backbone-amd/backbone',
        underscore: '../bower_components/underscore-amd/underscore',
    }
});

require([
    'backbone',
    './routes/notes-router'
], function (Backbone, NotesRouter) {
    // メモ本体とリスト
    var NotesRouter = new NotesRouter();
    Backbone.history.start();
});