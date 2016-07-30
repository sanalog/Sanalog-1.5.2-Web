<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="member-role.aspx.cs" Inherits="admin_uye_rol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').on("click", ".icon_sil", function () {
                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            $('.errors-in > div').remove();
            if (document.getElementById('<%= HdnHata.ClientID %>').value != "") {
                var hata = document.getElementById('<%= HdnHata.ClientID %>').value;
                var hataTur = document.getElementById('<%= HdnHataTur.ClientID %>').value;
                $('.errors-out').css('display', 'block');
                $('.errors-in').append('<div class="' + hataTur + '">' + hata + '</div>');
                document.getElementById('<%= HdnHata.ClientID %>').value = "";
                document.getElementById('<%= HdnHataTur.ClientID %>').value = "";
            }
        }
    </script>
    <div class="row uyeRol">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.members_role_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.members_role_help %></div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">

                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                    <a href="roles.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="HdnHata" runat="server" />
                            <asp:HiddenField ID="HdnHataTur" runat="server" />

                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.members_role_add_user %></div>
                                <div class="panel-body">

                                    <div class="row form-group-no-border">

                                        <div class="col-md-4">
                                            <label><%= Resources.admin_language.user_name %></label>
                                            <asp:TextBox ID="TBUser" CssClass="form-control" runat="server"></asp:TextBox>
                                            <cc1:AutoCompleteExtender runat="server" CompletionInterval="1000" DelimiterCharacters=""
                                                EnableCaching="False" Enabled="True" MinimumPrefixLength="3" ServiceMethod="GetCompletionList"
                                                ServicePath="" TargetControlID="TBUser" UseContextKey="True">
                                            </cc1:AutoCompleteExtender>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBUser" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                        </div>
                                        <div class="col-md-2">
                                            <label class="label-empty"></label>
                                            <asp:LinkButton runat="server" alt="Ekle" Text="<%$ Resources:admin_language, save %>" CommandName="Insert" class="btn btn-info icon_kaydet" OnClick="BtnEkle_Click" ValidationGroup="ekle"></asp:LinkButton>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.members_role_members %></div>
                                <div class="panel-body">
                                    <asp:GridView ID="GVUye" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SDSUye"
                                        AllowPaging="True" AllowSorting="True" DataKeyNames="UyeId" CssClass="table table-bordered table-striped">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                                <HeaderTemplate>
                                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input rel="Sec" type="checkbox" value="<%# Eval("UyeId") %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UserName" HeaderText="<%$ Resources:admin_language, user_name %>" SortExpression="UserName"
                                                ShowHeader="False" ItemStyle-CssClass="isim" />
                                        </Columns>
                                        <RowStyle CssClass="satir" />
                                        <AlternatingRowStyle CssClass="aSatir" />
                                        <EditRowStyle CssClass="eSatir" />
                                        <SelectedRowStyle CssClass="seciliSatir" />
                                        <PagerStyle CssClass="syfSatir" />
                                        <HeaderStyle CssClass="baslikSatir" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <asp:SqlDataSource ID="SDSUye" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                                SelectCommand="SELECT snlg_V1.TblUyeApp.UyeId, snlg_V1.TblUyeApp.UserName FROM snlg_V1.TblUyeApp INNER JOIN snlg_V1.TblRol_Uye ON snlg_V1.TblUyeApp.UyeId = snlg_V1.TblRol_Uye.UyeId WHERE (snlg_V1.TblRol_Uye.RolId = @RolId) AND (snlg_V1.TblUyeApp.UyeId &lt;&gt; @AdminId) ORDER BY snlg_V1.TblUyeApp.UyeId DESC"
                                DeleteCommand="DELETE FROM snlg_V1.TblRol_Uye WHERE (RolId = @RolId) AND (UyeId = @UyeId)">
                                <DeleteParameters>
                                    <asp:Parameter Name="UyeId" Type="Int32" />
                                    <asp:QueryStringParameter Name="RolId" Type="Int16" QueryStringField="rid" />
                                </DeleteParameters>
                                <SelectParameters>

                                    <asp:QueryStringParameter Name="RolId" Type="Int16" QueryStringField="rid" />
                                    <asp:Parameter Name="AdminId" Type="Int32" DefaultValue="<%$ AppSettings:AdminId %>" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SDSRol" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                                SelectCommand="SELECT RolId, RolAd FROM snlg_V1.TblRoller  ORDER BY RolAd">
                                <SelectParameters>
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <input type="hidden" name="HdnSil" />
        </div>
    </div>
</asp:Content>
