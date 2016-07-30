<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="authorization-keys.aspx.cs" Inherits="admin_yetkileri_duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager runat="server"></cc1:ToolkitScriptManager>
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
    <div class="row sablonlar">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.key_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.key_help %> </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HdnHata" runat="server" />
                    <asp:HiddenField ID="HdnHataTur" runat="server" />
                    <asp:FormView ID="Fv" runat="server" DataKeyNames="YetkiId" DataSourceID="Sds"
                        DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <asp:LinkButton runat="server" CssClass="btn btn-info icon_kaydet" CommandName="Insert" ValidationGroup="yekle"> <%= Resources.admin_language.save %></asp:LinkButton>
                                </div>
                            </div>
                            <div id="global_errors" class="errors-out">
                                <div class="errors-in"></div>
                            </div>
                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.key_add %></div>
                                <div class="panel-body">
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.key_meta %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Yetki") %>' />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="yekle"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row form-group-no-border no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.key_meta_desc %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("YetkiTanim") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.key_name %></div>
                        <div class="panel-body">
                            <asp:GridView ID="Gv" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="YetkiId"
                                DataSourceID="Sds" GridLines="None" AllowPaging="True" PageSize="100" OnDataBound="Gv_DataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="buttons" HeaderStyle-CssClass="buttons">
                                        <ItemTemplate>
                                            <div class="buttons">
                                                <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete"
                                                    class="btn btn-danger icon_sil" data-bb="confirm" data-confirm-text="Bu yetkiyi sildiğiniz takdirde admin sayfalarında bu anahtar kelime kontrol edilmeyecektir. İşlemi onaylıyormusunuz?"></asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Anahtar kelime" ItemStyle-CssClass="isim">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Yetki") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="ygunc" OnTextChanged="TBAd_TextChanged" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="ygunc"></asp:RequiredFieldValidator>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Yetki tanımı" ItemStyle-CssClass="YetkiTanim">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="T1" runat="server" CssClass="form-control" MaxLength="150" Text='<%# Bind("YetkiTanim") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="ygunc" OnTextChanged="T1_TextChanged" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerTemplate>
                                    <nav>
                                        <ul class="pagination" >
                                           <%-- <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>--%>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <%--<li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>--%>
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
                    <asp:SqlDataSource ID="Sds" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                        DeleteCommand="DELETE FROM snlg_V1.TblAdminYetkiler WHERE YetkiId = @YetkiId "
                        InsertCommand="INSERT INTO snlg_V1.TblAdminYetkiler (Yetki, YetkiTanim) VALUES (@Yetki, @YetkiTanim)"
                        OnDeleted="Sds_Deleted" SelectCommand="SELECT YetkiId, Yetki, YetkiTanim FROM snlg_V1.TblAdminYetkiler ORDER BY Yetki"
                        UpdateCommand="UPDATE snlg_V1.TblAdminYetkiler SET Yetki = @Yetki, YetkiTanim = @YetkiTanim WHERE (YetkiId = @YetkiId)"
                        OnInserted="Sds_Inserted" OnUpdated="Sds_Updated"
                        OnDeleting="Sds_Deleting" OnInserting="Sds_Inserting">
                        <InsertParameters>
                            <asp:Parameter Name="Yetki" Type="String" />
                            <asp:Parameter Name="YetkiTanim" Type="String" />
                        </InsertParameters>
                        <SelectParameters></SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="YetkiId" Type="Int16" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Yetki" Type="String" />
                            <asp:Parameter Name="YetkiTanim" Type="String" />
                            <asp:Parameter Name="YetkiId" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
