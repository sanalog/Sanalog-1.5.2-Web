<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="roles.aspx.cs" Inherits="admin_roller" %>

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

            $('.icon_rol-uye').click(function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "member-role.aspx?rid=" + $('input[rel=Sec]:checked:first').val();
            });

            $('.icon_rol-yetki').click(function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "role-authorization.aspx?rid=" + $('input[rel=Sec]:checked:first').val();
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
    <script type="text/javascript">
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
    <div class="row roller">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.roles_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.roles_help %></div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HdnHata" runat="server" />
                    <asp:HiddenField ID="HdnHataTur" runat="server" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.roles_add_form %></div>
                                <div class="panel-body">
                                    <asp:FormView ID="FVRol" runat="server" DataKeyNames="RolId" DataSourceID="SDSRol"
                                        DefaultMode="Insert">
                                        <InsertItemTemplate>
                                            <fieldset>
                                                <div class="row form-group-no-border">
                                                    <div class="col-md-4">
                                                        <label><%= Resources.admin_language.roles_add_name %></label>
                                                        <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("RolAd") %>' MaxLength="50" />
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="rekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="label-empty"></label>
                                                        <asp:LinkButton runat="server" class="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>" CommandName="Insert" ValidationGroup="rekle"></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>
                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <a href="javascript:;" class="btn btn-info icon_rol-uye"><i class="fa fa-users"></i> <%= Resources.admin_language.members_title %></a>
                                    <a href="javascript:;" class="btn btn-info icon_rol-yetki"><i class="fa fa-key"></i> <%= Resources.admin_language.roles_list %></a>
                                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.roles_group %></div>
                                <div class="panel-body">
                                    <asp:GridView ID="GVRol" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="RolId"
                                        DataSourceID="SDSRol" OnDataBound="GVRol_DataBound" AllowPaging="true" PageSize="10">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                                <HeaderTemplate>
                                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input rel="Sec" type="checkbox" value="<%# Eval("RolId") %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$ Resources:admin_language,roles_add_name %>" ItemStyle-CssClass="isim">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("RolAd") %>' AutoPostBack="True"
                                                        OnTextChanged="T1_TextChanged" MaxLength="50" CausesValidation="True" ValidationGroup="rgunc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="rgunc" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerTemplate>
                                            <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                                        </PagerTemplate>
                                        <RowStyle CssClass="satir" />
                                        <AlternatingRowStyle CssClass="aSatir" />
                                        <EditRowStyle CssClass="eSatir" />
                                        <SelectedRowStyle CssClass="seciliSatir" />

                                        <HeaderStyle CssClass="baslikSatir" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <asp:SqlDataSource ID="SDSRol" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                                SelectCommand="SELECT RolId, RolAd FROM snlg_V1.TblRoller  ORDER BY RolAd"
                                UpdateCommand="UPDATE snlg_V1.TblRoller SET RolAd = @RolAd WHERE (RolId = @RolId) "
                                InsertCommand="INSERT INTO snlg_V1.TblRoller(RolAd) VALUES (@RolAd)" OnInserting="SDSRol_Inserting">
                                <DeleteParameters>
                                    <asp:Parameter Name="RolId" Type="Int16" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="RolAd" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RolAd" Type="String" />
                                    <asp:Parameter Name="RolId" Type="Int16" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" name="HdnSil" />
</asp:Content>
