<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="templates.aspx.cs" Inherits="admin_sablonlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
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
            <div class="page-head-x4"><%= Resources.admin_language.temp_add_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.temp_add_help %></div>


            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HdnHata" runat="server" />
                    <asp:HiddenField ID="HdnHataTur" runat="server" />

                    <asp:FormView ID="FVSbl" runat="server" DataKeyNames="SablonId" DataSourceID="SdsSbl"
                        DefaultMode="Insert">

                        <InsertItemTemplate>

                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="<%$ Resources:admin_language, save %>" CssClass="btn btn-info icon_kaydet" CommandName="Insert" ValidationGroup="sekle"></asp:LinkButton>
                                </div>
                            </div>

                            <div id="global_errors" class="errors-out">
                                <div class="errors-in"></div>
                            </div>

                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.template_add_new %></div>
                                <div class="panel-body">



                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.tempalete_name %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="50" Text='<%# Bind("SablonAd") %>' />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sekle"></asp:RequiredFieldValidator>

                                        </div>

                                    </div>


                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.block_edit_exp %></label>
                                        <div class="col-md-6">

                                            <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>' />

                                        </div>

                                    </div>


                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.template_select_copy %></label>
                                        <div class="col-md-6">

                                            <asp:DropDownList ID="DDLSablon" CssClass="form-control" runat="server" DataSourceID="SdsSbl" DataTextField="SablonAd"
                                                AppendDataBoundItems="true" DataValueField="SablonId" SelectedValue='<%# Bind("CopySablonId") %>'>
                                                <asp:ListItem Text="<%$ Resources:admin_language, tempalete_copy %>" Value="" />
                                            </asp:DropDownList>
                                        </div>

                                    </div>




                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.templates_list %></div>
                        <div class="panel-body">

                            <asp:GridView ID="GvSbl" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="SablonId"
                                DataSourceID="SdsSbl" GridLines="None" AllowPaging="True" PageSize="50" OnDataBound="GvSbl_DataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="buttons" HeaderStyle-CssClass="buttons">
                                        <ItemTemplate>
                                            <div class="buttons">
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" class="btn btn-danger icon_sil" data-bb="confirm" 
                                                    data-confirm-text="Bu şablonu silmek istediğinizden eminmisiniz."></asp:LinkButton>
                                                <a href='<%#  Eval("SablonId", "template-design.aspx?sablonDesignId={0}&sAd=" + Server.UrlEncode(Eval("SablonAd").ToString())) %>' class="btn btn-warning icon_duzenle iiiframe"></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, tempalete_name %>" ItemStyle-CssClass="isim">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="50" Text='<%# Bind("SablonAd") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="TBAd_TextChanged" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sgunc"></asp:RequiredFieldValidator>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, description %>" ItemStyle-CssClass="aciklama">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="T1_TextChanged" />
                                            </div>
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
                        <asp:SqlDataSource ID="SdsSbl" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                            DeleteCommand="DELETE FROM snlg_V1.TblDesignSablonlar WHERE [SablonId] = @SablonId "
                            InsertCommand="snlg_V1.msp_SablonOlustur" InsertCommandType="StoredProcedure"
                            OnDeleted="SdsSbl_Deleted" SelectCommand="SELECT [SablonId], [SablonAd], [Aciklama] FROM snlg_V1.TblDesignSablonlar ORDER BY SablonAd"
                            UpdateCommand="UPDATE snlg_V1.TblDesignSablonlar SET SablonAd = @SablonAd, Aciklama = @Aciklama WHERE (SablonId = @SablonId) "
                            OnInserted="SdsSbl_Inserted" OnDeleting="SdsSbl_Deleting" OnInserting="SdsSbl_Inserting">
                            <InsertParameters>
                                <asp:Parameter Name="SablonAd" Type="String" />
                                <asp:Parameter Name="Aciklama" Type="String" />
                                <asp:Parameter Name="CopySablonId" Type="Int16" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="SablonId" Type="Int16" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="SablonAd" Type="String" />
                                <asp:Parameter Name="Aciklama" Type="String" />
                                <asp:Parameter Name="SablonId" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
