/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.language = 'tr';
    config.height = 400;
    //config.toolbarCanCollapse = true;
    config.entities = false;
    config.IncludeLatinEntities = false;
    config.enterMode = 2;
    config.newpage_html = '';
    config.allowedContent = true;
    //config.floatSpaceDockedOffsetX = 10;
    //config.floatSpacePinnedOffsetY = 20;
    config.extraPlugins = 'RGaleriEkle';

    CKEDITOR.dtd.$removeEmpty['i'] = false
    CKEDITOR.dtd.$removeEmpty['span'] = true
    CKEDITOR.dtd.$removeEmpty['div'] = true
    CKEDITOR.dtd.$removeEmpty['p'] = true

};
