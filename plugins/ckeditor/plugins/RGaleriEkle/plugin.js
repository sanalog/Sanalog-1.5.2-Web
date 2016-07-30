(function () {
    CKEDITOR.plugins.add('RGaleriEkle',
    {
        requires: ['RGaleriEkle'],
        init: function (editor) {
            var me = this;
            CKEDITOR.dialog.add('RGaleriEkleDialog', function () {
                return {
                    title: 'Add sanalog image gallery',
                    minWidth: 620,
                    minHeight: 225,
                    contents:
                          [
                             {
                                 id: 'iframe',
                                 label: 'Add sanalog image gallery',
                                 expand: true,
                                 elements:
                                       [
                                          {
                                              type: 'html',
                                              id: 'pageRGaleriEkle',
                                              label: 'Add sanalog image gallery',
                                              style: 'width : 100%;',
                                              html: '<iframe src="' + me.path + '/dialogs/RGaleriEkle.aspx" frameborder="0" name="iframeRGaleri" id="iframeRGaleri" allowtransparency="1" style="width:100%;margin:0;padding:0; height:200px;"></iframe>'
                                          }
                                       ]
                             }
                          ],
                    onShow: function () {
                    },
                    onOk: function () {
                        for (var i = 0; i < window.frames.length; i++) {
                            if (window.frames[i].name == 'iframeRGaleri') {
                                var objRGType = window.frames[i].document.getElementById("RGType");
                                var valRGType = objRGType.options[objRGType.selectedIndex].value;
                                var valRGGenislik = window.frames[i].document.getElementById("RGGenislik").value;
                                var valRGYukseklik = window.frames[i].document.getElementById("RGYukseklik").value;
                                var objRGaleri = window.frames[i].document.getElementById("DDLGaleri");
                                var valRGaleri = objRGaleri.options[objRGaleri.selectedIndex].value;
                                var textRGaleri = objRGaleri.options[objRGaleri.selectedIndex].text;
                            }
                        }

                        if (valRGGenislik != "")
                            valRGGenislik = 'width="' + valRGGenislik + '" ';
                        else
                            valRGGenislik = '';

                        if (valRGYukseklik != "")
                            valRGYukseklik = ' height="' + valRGYukseklik + '"';
                        else
                            valRGYukseklik = "";

                        sayfayaYaz = '<img src="/admin/themes/default/images/icon-image-gallery.png" type="image_gallery" gallery_type="' + valRGType + '" ' + valRGGenislik + valRGYukseklik + ' gallery_id="' + valRGaleri + '" title="' + textRGaleri + '" alt="' + textRGaleri + '" />';

                        final_html = sayfayaYaz;
                        editor.insertHtml(final_html);
                        updated_editor_data = editor.getData();
                        clean_editor_data = updated_editor_data.replace(final_html, sayfayaYaz);
                        editor.setData(clean_editor_data);
                    }
                };
            });

            editor.addCommand('RGaleriEkle', new CKEDITOR.dialogCommand('RGaleriEkleDialog'));

            editor.ui.addButton('RGaleriEkle',
            {
                label: 'Add sanalog image gallery',
                command: 'RGaleriEkle',
                icon: this.path + 'images/icon.gif',
                toolbar: 'insert'
            });
        }
    });
})();
