<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/announcement-add.aspx.cs" Inherits="admin_duyuruduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });
        });
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <cc1:ToolkitScriptManager runat="server" EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>
    <div class="row duyuruDuzenle">
        <div class="col-md-12">

            <asp:FormView ID="FVDuyuru" runat="server" DataKeyNames="DuyuruId" DataSourceID="SDSDyr"
                DefaultMode="Edit" OnDataBound="FVDuyuru_DataBound">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.announce_add_new %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.announce_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Insert" ValidationGroup="makekle" runat="server" class="btn btn-info icon_kaydet"><%= Resources.admin_language.announce_add_save %></asp:LinkButton>
                            <a href="announcements.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.announce_add_close %></a>
                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.announce_add_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_aspx_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_url %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_img %></label>
                                    <div class="col-md-6">

                                        <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                        <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />  
                                        <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVDuyuru.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                    
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_date %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, date_error_message%>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                            Type="Date" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE1" runat="server" TargetControlID="TbTarih">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_index %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="RBL1" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                        <label><%= Resources.admin_language.announce_add_content %></label>
                                        <div class="ckEditor">
                                            <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                CssClass="CKEditor" Text='<%# Bind("Duyuru") %>'>
                                            </CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>

                </InsertItemTemplate>





                <EditItemTemplate>


                    <div class="page-head-x4"><%= Resources.admin_language.announce_add_edit %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.announce_add_edit_help %></div>



                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" class="btn btn-success icon_kaydetyeniac"> <%= Resources.admin_language.save_new %></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" class="btn btn-info icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>'> <%= Resources.admin_language.delete %></asp:LinkButton>
                            <a href="announcements.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>


                        </div>
                    </div>




                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.announce_edit_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                    <div class="col-md-6">
                                        <%# DilleriListele(Eval("Diller")) %>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_aspx_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_url %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_img %></label>
                                    <div class="col-md-6">
                                        <p>
                                           <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                             <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                             <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVDuyuru.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                        
                                        </p>
                                        <p>
                                            <asp:LinkButton runat="server" CssClass="btn btn-default" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                                OnClick="LinkRSil_Click"> <%= Resources.admin_language.activity_image_delete %></asp:LinkButton>
                                        </p>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_date %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih", "{0:d}") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, date_error_message %>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                            Type="Date" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE2" runat="server" TargetControlID="TbTarih">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.announce_add_index %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="RBL1" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                        <label><%= Resources.admin_language.announce_add_content %></label>
                                        <div class="sayfaIcerik">
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("Duyuru") %>'>
                                                </CKEditor:CKEditorControl>
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
    <asp:SqlDataSource ID="SDSDyr" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_DuyuruEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_DuyuruDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SDSDyr_Inserted" UpdateCommand="snlg_V1.msp_DuyuruDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDSDyr_Updated" OnInserting="SDSDyr_Inserting"
        OnUpdating="SDSDyr_Updating" DeleteCommand="DELETE FROM snlg_V1.TblDuyuruDetay FROM snlg_V1.TblDuyuruDetay INNER JOIN snlg_V1.TblDuyuruApp ON snlg_V1.TblDuyuruDetay.DuyuruId = snlg_V1.TblDuyuruApp.DuyuruId WHERE (snlg_V1.TblDuyuruApp.DuyuruId = @DuyuruId) AND (snlg_V1.TblDuyuruDetay.Dil = @Dil)"
        OnDeleted="SDSDyr_Deleted" OnDeleting="SDSDyr_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="DuyuruId" QueryStringField="did" />

        </DeleteParameters>
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="DuyuruId" QueryStringField="did" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="DuyuruId" QueryStringField="did" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="Gorunurluk" Type="Byte"  DefaultValue="1"/>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Duyuru" Type="String" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>

            <asp:Parameter Name="Gorunurluk" Type="Byte"  DefaultValue="1"/>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Duyuru" Type="String" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
