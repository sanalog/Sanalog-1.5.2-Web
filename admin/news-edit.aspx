<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/news-edit.aspx.cs" Inherits="admin_haberduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });

            $('textarea[limit]').keyup(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            }).keydown(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            });
        });
    </script>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <cc1:ToolkitScriptManager runat="server" EnableScriptGlobalization="True"></cc1:ToolkitScriptManager>
    <div class="row haberDuzenle">
        <div class="col-md-12">
            <asp:FormView ID="FVHaber" runat="server" DataKeyNames="HaberId" DataSourceID="SDSHbr"
                DefaultMode="Edit" OnDataBound="FVHaber_DataBound">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.news_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.news_add_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Insert" ValidationGroup="sekle" runat="server" Text="<%$ Resources:admin_language, save %>" CssClass="btn btn-info icon_kaydet"> </asp:LinkButton>
                            <a href="news.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.news_add_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.heading %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                    <div class="col-md-6">

                                        <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                        <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                       <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVHaber.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                        
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                            TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                        <br />
                                        <span class="spanlimit" id="TBilgiSay" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_date %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, date_error_message %>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                            Type="Date" ValidationGroup="sekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE1" runat="server" TargetControlID="TbTarih"></cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_index %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                            <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <div class="col-md-12">
                                        <label><%= Resources.admin_language.news_add_content %></label>
                                        <div class="sayfaIcerik">
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("Haber") %>'> </CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </InsertItemTemplate>

                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.news_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.news_edit_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton ID="LinkButon1" CommandName="Update" ValidationGroup="sekle" Text="<%$ Resources:admin_language, save %>" runat="server" class="btn btn-info icon_kaydet"><i class="fa fa-floppy-circle"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButon2" CommandName="Update" ValidationGroup="sekle" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButon3" CommandName="delete" runat="server" class="btn btn-dander icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"> Sil</asp:LinkButton>
                            <a href="news.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %> </a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.news_edit_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                    <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %> </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.heading %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="500" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                    <div class="col-md-6">
                                        <p>
                                             <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                             <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                             <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVHaber.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                        </p>
                                        <p>
                                            <asp:LinkButton runat="server" CssClass="btn btn-default" Text="<%$ Resources:admin_language, activity_image_delete%>" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                                OnClick="LinkRSil_Click"> </asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                            TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                        <br />
                                        <span class="spanlimit" id="TBilgiSay" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_date %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih", "{0:d}") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, date_error_message %>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                            Type="Date" ValidationGroup="sekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE2" runat="server" TargetControlID="TbTarih"></cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.article_add_index %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                            <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <div class="col-md-12">
                                        <label><%= Resources.admin_language.news_add_content %></label>
                                        <div class="sayfaIcerik">
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("Haber") %>'> </CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSHbr" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_HaberEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_HaberDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SDSHbr_Inserted" UpdateCommand="snlg_V1.msp_HaberDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDSHbr_Updated" OnInserting="SDSHbr_Inserting"
        OnUpdating="SDSHbr_Updating" DeleteCommand="DELETE FROM snlg_V1.TblHaberDetay FROM snlg_V1.TblHaberDetay INNER JOIN snlg_V1.TblHaberApp ON snlg_V1.TblHaberDetay.HaberId = snlg_V1.TblHaberApp.HaberId WHERE (snlg_V1.TblHaberApp.HaberId = @HaberId) AND (snlg_V1.TblHaberDetay.Dil = @Dil)"
        OnDeleted="SDSHbr_Deleted" OnDeleting="SDSHbr_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="HaberId" QueryStringField="hid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="HaberId" QueryStringField="hid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="HaberId" QueryStringField="hid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Haber" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Haber" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
