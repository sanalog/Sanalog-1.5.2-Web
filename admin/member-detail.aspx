<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="member-detail.aspx.cs" Inherits="admin_uyedetay" %>

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
   

    <!-- FILE UPLOAD -->
    <link rel="stylesheet" media="screen" href="<%= Snlg_ConfigValues.AdminThemePath %>js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="<%= Snlg_ConfigValues.AdminThemePath %>js/jquery-upload/css/jquery.fileupload.css" />
    <link rel="stylesheet" href="<%= Snlg_ConfigValues.AdminThemePath %>js/jquery-upload/css/jquery.fileupload-ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager runat="server" EnableScriptGlobalization="true"></cc1:ToolkitScriptManager>
    <div class="row uyeDetay">
        <div class="col-md-12">
            <asp:FormView ID="FVUye" runat="server" DataSourceID="SDSUye" DefaultMode="Edit">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.members_detail_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.members_detail_help %></div>
                    <div class="row mb-md">
                        <div class="col-md-12">
                            <asp:LinkButton ID="LinkButton4" CommandName="Insert" ValidationGroup="uekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                            <a href="members.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.members_add_form %></div>
                        <div class="panel-body">
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.e_post %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("Eposta") %>' MaxLength="75" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="uekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:admin_language,e_post_error_message %>" ValidationExpression="([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})"
                                        ValidationGroup="uekle" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.user_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T14" CssClass="form-control" runat="server" Text='<%# Bind("UserName") %>' MaxLength="25" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="uekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.password %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TSifre" CssClass="form-control" runat="server" Text='<%# Bind("Sifre") %>' MaxLength="15" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="uekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.active %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="CB" runat="server" Checked='<%# Bind("Aktif") %>' />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.company_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T2" CssClass="form-control" runat="server" Text='<%# Bind("Firma") %>' MaxLength="200" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.name_surname %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T3" CssClass="form-control" runat="server" Text='<%# Bind("UyeAd") %>' MaxLength="75" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.birth_date %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T4" CssClass="form-control" runat="server" Text='<%# Bind("DTarih") %>' MaxLength="10" />
                                    <asp:RangeValidator runat="server" ControlToValidate="T4" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language,date_error_message %>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                        Type="Date" ValidationGroup="uekle" SetFocusOnError="true"></asp:RangeValidator>
                                    <cc1:CalendarExtender ID="CE1" runat="server" TargetControlID="T4"></cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.home_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T5" CssClass="form-control" runat="server" Text='<%# Bind("EvTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.work_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T6" CssClass="form-control" runat="server" Text='<%# Bind("IsTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.mobil_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T7" CssClass="form-control" runat="server" Text='<%# Bind("CepTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.mobil_fax %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T13" CssClass="form-control" runat="server" Text='<%# Bind("Faks") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.address %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T8" CssClass="form-control" runat="server" Text='<%# Bind("Adres") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.tax_admin %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T9" CssClass="form-control" runat="server" Text='<%# Bind("VDaire") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.tax_no %>Vergi No</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T10" CssClass="form-control" runat="server" Text='<%# Bind("VNo") %>' MaxLength="15" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.members_id_no %>T.C No</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T11" CssClass="form-control" runat="server" Text='<%# Bind("TCNo") %>' MaxLength="11" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>
                                       <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                        <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />  
                                        <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVUye.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                    </p>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.more_information %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("UyeBilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="10000" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.members_edit_form_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.members_edit_form_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12 ">
                            <asp:LinkButton ID="LinkButton1" CommandName="Update" ValidationGroup="uedit" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" CommandName="Update" ValidationGroup="uedit" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" CommandName="delete" runat="server" Text="<%$ Resources:admin_language, delete %>" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <a href="members.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.members_edit_form %></div>
                        <div class="panel-body">
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %> </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.e_post %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("Eposta") %>' MaxLength="75" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="uedit" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:admin_language, e_post_error_message %>" ValidationExpression="([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})"
                                        ValidationGroup="uedit" SetFocusOnError="true"> </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.user_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T14" CssClass="form-control" runat="server" Text='<%# Bind("UserName") %>' MaxLength="25" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="uedit" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.incorrect_entr %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBHata" CssClass="form-control" runat="server" Text='<%# Bind("HataSay") %>' MaxLength="1" />
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TBHata" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language,range_validator_error %>" MaximumValue="5" MinimumValue="0" Type="Integer"
                                        ValidationGroup="uedit" SetFocusOnError="true"> </asp:RangeValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.password %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TSifre" CssClass="form-control" runat="server" MaxLength="15" TextMode="Password" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.active %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="CB" runat="server" Checked='<%# Bind("Aktif") %>' />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.company_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T2" CssClass="form-control" runat="server" Text='<%# Bind("Firma") %>' MaxLength="200" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.name_surname %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T3" CssClass="form-control" runat="server" Text='<%# Bind("UyeAd") %>' MaxLength="75" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.birth_date %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T4" CssClass="form-control" runat="server" Text='<%# Bind("DTarih","{0:d}") %>' MaxLength="10" />
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="T4" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language,date_error_message %>" MaximumValue="1.1.2100" MinimumValue="1.1.1900"
                                        Type="Date" ValidationGroup="uekle" SetFocusOnError="true"></asp:RangeValidator>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="T4"></cc1:CalendarExtender>


                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.home_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T5" CssClass="form-control" runat="server" Text='<%# Bind("EvTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.work_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T6" CssClass="form-control" runat="server" Text='<%# Bind("IsTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.mobil_phone %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T7" CssClass="form-control" runat="server" Text='<%# Bind("CepTel") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.mobil_fax %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T13" CssClass="form-control" runat="server" Text='<%# Bind("Faks") %>' MaxLength="20" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.address %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T8" CssClass="form-control" runat="server" Text='<%# Bind("Adres") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.tax_admin %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T9" CssClass="form-control" runat="server" Text='<%# Bind("VDaire") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.tax_no %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T10" CssClass="form-control" runat="server" Text='<%# Bind("VNo") %>' MaxLength="15" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.members_id_no %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="T11" CssClass="form-control" runat="server" Text='<%# Bind("TCNo") %>' MaxLength="11" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>

                                             <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                             <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                             <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVUye.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                         </p>
                                    <p>
                                        <asp:LinkButton ID="LinkRSil" runat="server" CssClass="btn btn-default" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                            OnClick="LinkRSil_Click"><%= Resources.admin_language.activity_image_delete %></asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.more_information %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("UyeBilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="10000" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSUye" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_UyeDetaySec" SelectCommandType="StoredProcedure" OnInserting="SDSUye_Inserting"
        OnUpdating="SDSUye_Updating" InsertCommand="snlg_V1.msp_UyeOlustur" InsertCommandType="StoredProcedure"
        OnInserted="SDSUye_Inserted" UpdateCommand="snlg_V1.msp_UyeGuncelle" UpdateCommandType="StoredProcedure"
        OnUpdated="SDSUye_Updated" DeleteCommand="DELETE FROM snlg_V1.TblUyeDetayDil FROM snlg_V1.TblUyeDetayDil INNER JOIN snlg_V1.TblUyeApp ON snlg_V1.TblUyeDetayDil.UyeId = snlg_V1.TblUyeApp.UyeId WHERE (snlg_V1.TblUyeApp.UyeId = @UyeId) AND (snlg_V1.TblUyeDetayDil.Dil = @Dil)"
        OnDeleted="SDSUye_Deleted" OnDeleting="SDSUye_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UyeId" QueryStringField="uid" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Firma" Type="String" />
            <asp:Parameter Name="UyeAd" Type="String" />
            <asp:Parameter Name="DTarih" DbType="Date" />
            <asp:Parameter Name="EvTel" Type="String" />
            <asp:Parameter Name="IsTel" Type="String" />
            <asp:Parameter Name="CepTel" Type="String" />
            <asp:Parameter Name="Faks" Type="String" />
            <asp:Parameter Name="Eposta" Type="String" />
            <asp:Parameter Name="Sifre" Type="String" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="VDaire" Type="String" />
            <asp:Parameter Name="VNo" Type="String" />
            <asp:Parameter Name="TCNo" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="UyeBilgi" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UyeId" QueryStringField="uid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Firma" Type="String" />
            <asp:Parameter Name="UyeAd" Type="String" />
            <asp:Parameter Name="DTarih" DbType="Date" />
            <asp:Parameter Name="EvTel" Type="String" />
            <asp:Parameter Name="IsTel" Type="String" />
            <asp:Parameter Name="CepTel" Type="String" />
            <asp:Parameter Name="Faks" Type="String" />
            <asp:Parameter Name="Eposta" Type="String" />
            <asp:Parameter Name="Sifre" Type="String" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="VDaire" Type="String" />
            <asp:Parameter Name="VNo" Type="String" />
            <asp:Parameter Name="TCNo" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="UyeBilgi" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="HataSay" Type="Byte" />
            <asp:QueryStringParameter Name="UyeId" QueryStringField="uid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />

        </UpdateParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnYeni" />
</asp:Content>
