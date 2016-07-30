<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/email-forms-edit.aspx.cs" Inherits="admin_varsayilan_eposta_duzenle" %>

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
    <cc1:ToolkitScriptManager runat="server" EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>
    <div class="row haberDuzenle">
        <div class="col-md-12">


            <asp:FormView ID="FV" runat="server" DataSourceID="SDS"
                DefaultMode="Edit" >
                <InsertItemTemplate>

                    <div class="page-head-x4"><%= Resources.admin_language.email_form_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.email_form_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Insert" ValidationGroup="sekle" runat="server" CssClass="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                            <a href="email-forms.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>


                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.email_add_form %></div>
                        <div class="panel-body">

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpHoutUrl" runat="server" CssClass="form-control" Text='<%# Bind("SmtpHost") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtSmtpHoutUrl" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_user %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB1" runat="server" CssClass="form-control" Text='<%# Bind("Kimden") %>' MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_pass %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpSifre" runat="server" CssClass="form-control" Text='<%# Bind("SmtpPsw") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtSmtpSifre" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_port %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpPort" runat="server" CssClass="form-control" Text='<%# Bind("SmtpPort") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtSmtpPort" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_key_value %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBAnahtar" runat="server" CssClass="form-control" Text='<%# Bind("Anahtar") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TBAnahtar" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_send_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB6" runat="server" CssClass="form-control" Text='<%# Bind("KimdenIsim") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_send_mail %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB2" runat="server" CssClass="form-control" Text='<%# Bind("Kime") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_subject %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB3" runat="server" CssClass="form-control" Text='<%# Bind("Konu") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.description %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB4" runat="server" CssClass="form-control" Text='<%# Bind("Aciklama") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_ssl %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox runat="server" ID="ChkBoxSSL" Checked='<%#Bind("Ssl_")%>' />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_speci %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="5000" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>
                            <div class="row form-group-no-border no-gutter">
 <label class="col-md-6"><%= Resources.admin_language.email_add_form_message %></label>
                                <div class="col-md-6">
                                   
                                    <div class="ckEditor">
                                        <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                            CssClass="CKEditor" Text='<%# Bind("Mesaj") %>'>
                                        </CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </InsertItemTemplate>


                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.email_edit_form_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.email_edit_form_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Update" ValidationGroup="sekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="sekle" runat="server" class="btn btn-success icon_kaydetyeniac"> <%= Resources.admin_language.save_new %></asp:LinkButton>
                            <a href="email-forms.aspx" class="btn btn-default icon_kapat"> <%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.email_edit_form_title %></div>
                        <div class="panel-body">

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpHoutUrl" runat="server" CssClass="form-control" Text='<%# Bind("SmtpHost") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtSmtpHoutUrl" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_user %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB1" runat="server" CssClass="form-control" Text='<%# Bind("Kimden") %>' MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_pass %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpSifre" runat="server" CssClass="form-control" Text='<%# Bind("SmtpPsw") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtSmtpSifre" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_port %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TxtSmtpPort" runat="server" CssClass="form-control" Text='<%# Bind("SmtpPort") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtSmtpPort" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_key_value %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBAnahtar" runat="server" CssClass="form-control" Text='<%# Bind("Anahtar") %>' MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBAnahtar" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_send_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB6" runat="server" CssClass="form-control" Text='<%# Bind("KimdenIsim") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_send_mail %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB2" runat="server" CssClass="form-control" Text='<%# Bind("Kime") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_subject %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB3" runat="server" CssClass="form-control" Text='<%# Bind("Konu") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.description %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TB4" runat="server" CssClass="form-control" Text='<%# Bind("Aciklama") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_ssl %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox runat="server" ID="ChkBoxSSL" Checked='<%# Bind("Ssl_")%>' />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.email_add_form_speci %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="5000" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>
                            <div class="row form-group-no-border no-gutter">
 <label class="col-md-6"><%= Resources.admin_language.email_add_form_message %></label>
                                <div class="col-md-6">
                                   
                                    <div class="ckEditor">
                                        <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                            CssClass="CKEditor" Text='<%# Bind("Mesaj") %>'>
                                        </CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </EditItemTemplate>




            </asp:FormView>



        </div>
    </div>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_EPostaSablonEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_EPostaSablonDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SDS_Inserted" UpdateCommand="snlg_V1.msp_EPostaSablonDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDS_Updated" OnInserting="SDS_Inserting"
        OnUpdating="SDS_Updating">
        <SelectParameters>

            <asp:QueryStringParameter Name="EPId" QueryStringField="epid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="EPId" QueryStringField="epid" Type="Int32" />

            <asp:Parameter Name="Ssl_" Type="Boolean" />
            <asp:Parameter Name="SmtpPsw" Type="String" />
            <asp:Parameter Name="SmtpPort" Type="String" />
            <asp:Parameter Name="SmtpHost" Type="String" />
            <asp:Parameter Name="Anahtar" Type="String" />
            <asp:Parameter Name="Kimden" Type="String" />
            <asp:Parameter Name="KimdenIsim" Type="String" />
            <asp:Parameter Name="Kime" Type="String" />
            <asp:Parameter Name="Konu" Type="String" />
            <asp:Parameter Name="Mesaj" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Ssl_" Type="Boolean" />
            <asp:Parameter Name="SmtpPsw" Type="String" />
            <asp:Parameter Name="SmtpPort" Type="String" />
            <asp:Parameter Name="SmtpHost" Type="String" />
            <asp:Parameter Name="Anahtar" Type="String" />
            <asp:Parameter Name="Kimden" Type="String" />
            <asp:Parameter Name="KimdenIsim" Type="String" />
            <asp:Parameter Name="Kime" Type="String" />
            <asp:Parameter Name="Konu" Type="String" />
            <asp:Parameter Name="Mesaj" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
