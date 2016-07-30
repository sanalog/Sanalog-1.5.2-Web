<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="UrlKeys.aspx.cs" Inherits="admin_UrlKeys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.url_keys_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.url_keys_help %>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <asp:FormView ID="FVSyf" runat="server" DataSourceID="SdsUrlkeysGroup" OnDataBound="FVSyf_DataBound"
                        DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <asp:LinkButton ID="LinkButton1" CommandName="Insert" ValidationGroup="ekle" Text="<%$ Resources:admin_language, save %>" runat="server"
                                        alt="Ekle" class="btn btn-info icon_kaydet"></asp:LinkButton>
                                </div>
                            </div>

                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.url_keys_add %></div>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.languages_edit_slct %></label>
                                            <div class="col-md-6">
                                                <asp:Literal runat="server" ID="LtrDiller"></asp:Literal>
                                            </div>
                                        </div>
                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.url_keys_name %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TxtUrlKeysAdi" CssClass="form-control" runat="server" Text='<%# Bind("UrlKeyName") %>'
                                                    MaxLength="250" CausesValidation="True" ValidationGroup="edit"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUrlKeysAdi" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.url_keys_value %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TxtUrlKeysDegeri" CssClass="form-control" runat="server" Text='<%# Bind("UrlKeyValue") %>'
                                                    MaxLength="250" CausesValidation="True" ValidationGroup="edit"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtUrlKeysDegeri" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </InsertItemTemplate>
                    </asp:FormView>

                </div>


                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.url_keys %></div>
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.edit_lang %></label>
                                    <div class="col-md-4">
                                        <asp:Literal runat="server" ID="LtrDiller"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                            <asp:GridView ID="GVUrlKeys" runat="server" class="table table-bordered table-striped"
                                AutoGenerateColumns="False" DataKeyNames="UrlKeyID" DataSourceID="SdsUrlkeysGroup" GridLines="None">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" CommandName="Delete" runat="server"
                                                class="btn btn-danger icon_sil" data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UrlKeyName" HeaderText="Url Key Name" />
                                    <asp:TemplateField HeaderText="Url Keys Değeri">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TxtUrlKeysDegeri" CssClass="form-control" runat="server" Text='<%# Bind("UrlKeyValue") %>'
                                                MaxLength="250" CausesValidation="True" ValidationGroup="edit" AutoPostBack="True" OnTextChanged="TxtUrlKeysDegeri_TextChanged"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtUrlKeysDegeri" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="edit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                </div>
            </div>

        </div>
    </div>
    <asp:SqlDataSource ID="SdsUrlkeysGroup" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT * FROM snlg_V1.TblUrlKeys WHERE Dil=ISNULL(@Dil, @DefaultLang)"
        InsertCommand="snlg_V1.msp_UrlKeysOlustur" InsertCommandType="StoredProcedure" OnInserted="SdsUrlkeysGroup_Inserted"
        OnInserting="SdsUrlkeysGroup_Inserting"
        UpdateCommand="UPDATE snlg_V1.TblUrlKeys SET UrlKeyValue = @UrlKeyValue WHERE (UrlKeyID = @UrlKeyID)"
        DeleteCommand="DELETE FROM snlg_V1.TblUrlKeys WHERE  (UrlKeyID = @UrlKeyID);"
        OnDeleted="SdsUrlkeysGroup_Deleted" OnDeleting="SdsUrlkeysGroup_Deleting">
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="UrlKeyName" Type="String" />
            <asp:Parameter Name="UrlKeyValue" Type="String" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" DefaultValue="0" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UrlKeyValue" Type="String" />
            <asp:Parameter Name="UrlKeyID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="UrlKeyID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>


