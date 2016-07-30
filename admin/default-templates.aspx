<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="default-templates.aspx.cs" Inherits="admin_varsayilan_sablonlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script>
        $(document).ready(function () {

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager runat="server">
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
    <div class="row sablonlar">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.default_temp_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.default_temp_help %></div>


            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HdnHata" runat="server" />
                    <asp:HiddenField ID="HdnHataTur" runat="server" />
                    <div class="refbox">



                        <asp:FormView ID="FV" runat="server" DataKeyNames="AnahtarId" DataSourceID="SDS" DefaultMode="Insert">
                            <InsertItemTemplate>

                                <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                    <div class="col-md-12">
                                        <asp:LinkButton runat="server" CssClass="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>" CommandName="Insert" ValidationGroup="sekle" data-place=""></asp:LinkButton>
                                    </div>
                                </div>




                                <div id="global_errors" class="errors-out">
                                    <div class="errors-in">
                                    </div>
                                </div>

                                <div class="panel">
                                    <div class="panel-heading"><%= Resources.admin_language.default_temp_meta %></div>
                                    <div class="panel-body">

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.default_temp_add_meta %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox CssClass="form-control" ID="TBAd" runat="server" MaxLength="50" Text='<%# Bind("SablonAnahtar") %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sekle"></asp:RequiredFieldValidator>
                                            </div>

                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.description %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox CssClass="form-control" ID="T1" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>' />

                                            </div>

                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.default_select_temp %></label>
                                            <div class="col-md-6">
                                                <asp:DropDownList CssClass="form-control" ID="DDLSablon" runat="server" DataSourceID="SDSSablon" DataTextField="SablonAd"
                                                    DataValueField="SablonId" SelectedValue='<%# Bind("SablonId") %>'>
                                                </asp:DropDownList>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </InsertItemTemplate>
                        </asp:FormView>






                        <div class="panel">
                            <div class="panel-heading"><%= Resources.admin_language.default_temp_list %></div>
                            <div class="panel-body">
                                <asp:GridView ID="GV" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="AnahtarId"
                                    DataSourceID="SDS" GridLines="None" AllowPaging="True" PageSize="30" OnDataBound="GV_DataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="buttons" HeaderStyle-CssClass="buttons">
                                            <ItemTemplate>
                                                <div class="buttons">
                                                    <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete"
                                                        class="btn btn-danger icon_sil"></asp:LinkButton>
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="buttons" />
                                            <ItemStyle CssClass="buttons" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:admin_language, default_temp_add_meta%>" ItemStyle-CssClass="isim">
                                            <ItemTemplate>
                                                <div class="sablonInput">
                                                    <asp:TextBox CssClass="form-control" ID="TBAd" runat="server" MaxLength="50" Text='<%# Bind("SablonAnahtar") %>'
                                                        AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="TBAd_TextChanged" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sgunc"></asp:RequiredFieldValidator>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="isim" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:admin_language, description %>" ItemStyle-CssClass="aciklama">
                                            <ItemTemplate>
                                                <div class="sablonInput">
                                                    <asp:TextBox CssClass="form-control" ID="T1" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>'
                                                        AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="T1_TextChanged" />
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="aciklama" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:admin_language, template %>" ItemStyle-CssClass="aciklama">
                                            <ItemTemplate>
                                                <div class="sablonInput">
                                                    <asp:DropDownList CssClass="form-control" ID="RblSablon" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                                        DataValueField="SablonId" SelectedValue='<%# Bind("SablonId") %>' AutoPostBack="true" OnSelectedIndexChanged="RblSablon_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="aciklama" />
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
                                <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                                    DeleteCommand="DELETE FROM snlg_V1.TblSablon_Modul WHERE [AnahtarId] = @AnahtarId "
                                    InsertCommand="INSERT INTO snlg_V1.TblSablon_Modul (SablonAnahtar, Aciklama, SablonId) VALUES(@SablonAnahtar, @Aciklama, @SablonId)"
                                    OnDeleted="SDS_Deleted" SelectCommand="SELECT AnahtarId, SablonAnahtar, Aciklama, SablonId FROM snlg_V1.TblSablon_Modul ORDER BY SablonAnahtar"
                                    UpdateCommand="UPDATE snlg_V1.TblSablon_Modul SET SablonAnahtar = @SablonAnahtar, Aciklama = @Aciklama, SablonId = @SablonId WHERE (AnahtarId = @AnahtarId) "
                                    OnInserted="SDS_Inserted" OnUpdated="SDS_Updated" OnDeleting="SDS_Deleting" OnInserting="SDS_Inserting">
                                    <InsertParameters>
                                        <asp:Parameter Name="SablonAnahtar" Type="String" />
                                        <asp:Parameter Name="Aciklama" Type="String" />
                                        <asp:Parameter Name="SablonId" Type="Int16" />
                                    </InsertParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="AnahtarId" Type="Int16" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="SablonId" Type="Int16" />
                                        <asp:Parameter Name="SablonAnahtar" Type="String" />
                                        <asp:Parameter Name="Aciklama" Type="String" />
                                        <asp:Parameter Name="AnahtarId" Type="Int16" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SdsSablon" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                                    SelectCommand="SELECT SablonId, SablonAd FROM snlg_V1.TblDesignSablonlar ORDER BY SablonAd"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
