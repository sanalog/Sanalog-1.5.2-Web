<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="default-photos.aspx.cs" Inherits="admin_varsayilan_resimler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
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
    <div class="row sablonlar">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.default_photos_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.default_photos_help %></div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="HdnHata" runat="server" />
                    <asp:HiddenField ID="HdnHataTur" runat="server" />

                    <asp:FormView ID="FV" runat="server" DataKeyNames="AnahtarId" DataSourceID="SDS" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <asp:LinkButton runat="server" CssClass="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>" CommandName="Insert" ValidationGroup="sekle"></asp:LinkButton>
                                </div>
                            </div>

                            <div id="global_errors" class="errors-out">
                                <div class="errors-in">
                                </div>
                            </div>


                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.default_photos_form %></div>
                                <div class="panel-body">


                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.default_photos_name %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="50" Text='<%# Bind("ResimAnahtar") %>' />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sekle"></asp:RequiredFieldValidator>
                                        </div>

                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.default_photos_exp %>Açıklama</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>' />
                                        </div>

                                    </div>
                                    <div class="row form-group-no-border no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                        <div class="col-md-6">
                                            <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("ResimYol") %>' />
                                            <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                            <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni" onclick="SnlgOpenSingleManager('<%=FV.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.default_photos_list %></div>
                        <div class="panel-body">

                            <asp:GridView ID="GV" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="AnahtarId"
                                DataSourceID="SDS" GridLines="None" AllowPaging="True" PageSize="30" OnDataBound="GV_DataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="buttons" HeaderStyle-CssClass="buttons">
                                        <ItemTemplate>
                                            <div class="buttons">
                                                <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete"
                                                    class="btn btn-default icon_sil"></asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="buttons" />
                                        <ItemStyle CssClass="buttons" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, default_photos_name %>" ItemStyle-CssClass="isim">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="50" Text='<%# Bind("ResimAnahtar") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="TBAd_TextChanged" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="sgunc"></asp:RequiredFieldValidator>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="isim" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, default_photos_exp %>" ItemStyle-CssClass="aciklama">
                                        <ItemTemplate>
                                            <div class="sablonInput">
                                                <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Aciklama") %>'
                                                    AutoPostBack="true" CausesValidation="true" ValidationGroup="sgunc" OnTextChanged="T1_TextChanged" />
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="aciklama" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, article_add_img %>" ItemStyle-CssClass="aciklama">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("ResimYol") %>' />
                                            <img src="<%# Eval("ResimYol") %>" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                            <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni" onclick="SnlgOpenSingleManager($(this).closest('td').find('[type=hidden]').attr('id'));"><%= Resources.admin_language.default_photos_img %></a>

                                            <asp:LinkButton ID="LinkRSil" runat="server" CssClass="btn btn-default"
                                                Text="<%$ Resources:admin_language, activity_image_delete %>"
                                                Visible='<%# !string.IsNullOrEmpty(Eval("ResimYol").ToString()) %>'
                                                CommandArgument='<%# Bind("AnahtarID") %>' OnCommand="LinkRSil_Command"></asp:LinkButton>
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

                                <HeaderStyle CssClass="AnahtarSatir" />
                            </asp:GridView>

                        </div>
                    </div>





                    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                        DeleteCommand="DELETE FROM snlg_V1.TblVarsayilanResimler WHERE [AnahtarId] = @AnahtarId"
                        InsertCommand="INSERT INTO snlg_V1.TblVarsayilanResimler (ResimAnahtar, Aciklama, ResimYol) VALUES(@ResimAnahtar, @Aciklama, @ResimYol)"
                        OnDeleted="SDS_Deleted" SelectCommand="SELECT AnahtarId, ResimAnahtar, Aciklama, ResimYol FROM snlg_V1.TblVarsayilanResimler ORDER BY ResimAnahtar"
                        UpdateCommand="UPDATE snlg_V1.TblVarsayilanResimler SET ResimAnahtar = @ResimAnahtar, Aciklama = @Aciklama, ResimYol = @ResimYol WHERE (AnahtarId = @AnahtarId)"
                        OnInserted="SDS_Inserted" OnUpdated="SDS_Updated"
                        OnDeleting="SDS_Deleting" OnInserting="SDS_Inserting">
                        <InsertParameters>
                            <asp:Parameter Name="ResimAnahtar" Type="String" />
                            <asp:Parameter Name="Aciklama" Type="String" />
                            <asp:Parameter Name="ResimYol" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="AnahtarId" Type="Int16" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ResimYol" Type="String" />
                            <asp:Parameter Name="ResimAnahtar" Type="String" />
                            <asp:Parameter Name="Aciklama" Type="String" />
                            <asp:Parameter Name="AnahtarId" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


    <asp:Button ID="BtnSaveImage" runat="server" CssClass="btnFMSave" OnClick="BtnSaveImage_Click" Style="display: none;" />
</asp:Content>
