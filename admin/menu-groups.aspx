<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="menu-groups.aspx.cs" Inherits="admin_menu_groups" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <div class="row blokDuzenle">
        <div class="col-md-12">
            <asp:FormView ID="FVIcerik" runat="server" DataKeyNames="UCId" DataSourceID="SdsIcerik"
                DefaultMode="Edit" OnDataBound="FVIcerik_DataBound">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.menu_group_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.menu_group_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton ID="LinkButton4" CommandName="Insert" ValidationGroup="ekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.menu_group_entry_form %></div>
                        <div class="panel-body">

                            <div class="col-md-12">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.menu_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBTitle" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBTitle" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                            <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.menu_list %></div>
                <div class="panel-body">
                    <asp:GridView ID="GVSyf" class="table table-bordered table-striped" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="UCId"
                        DataSourceID="Sdsicerikler" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href="menus.aspx?gid=<%# Eval("UCId") %>" title="Menü Gir" class="btn btn-info"><i class="fa fa-edit"></i> Düzenle</a>
                                    <a href="block-attributes.aspx?ucid=<%# Eval("UCId") %>" title="Nitelikler" class="btn btn-warning icon_attr"><i class="fa fa-cog"></i> Nitelikler</a>
                                    <asp:LinkButton runat="server" CommandName="Delete" class="btn btn-danger icon_sil"
                                        data-bb="confirm" data-confirm-text="Bu menü ve altında bulunan tüm menüler kaldırılacaktır. Onaylıyor musunuz?">Sil</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:admin_language, menu_name %>">
                                <ItemTemplate>
                                    <asp:TextBox ID="TBTitle" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Title") %>' AutoPostBack="True" CausesValidation="True" OnTextChanged="TBTitle_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBTitle" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="upd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:DropDownList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'
                                        CssClass="gorunurluk form-control" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="RBL1_SelectedIndexChanged">
                                        <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                    </asp:DropDownList>
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


    <asp:SqlDataSource ID="SdsIcerik" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_UCIcerikSecDuzenle" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_UCIcerikOlustur" InsertCommandType="StoredProcedure"
        OnSelected="SdsIcerik_Selected"
        OnInserted="SdsIcerik_Inserted" OnInserting="SdsIcerik_Inserting">
        <SelectParameters>
            <snlg:ApplicationParameter Name="Dil" AppKeyName="DefaultLang" />
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
            <asp:Parameter Name="BlokType" Type="Int16" DefaultValue="2" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="BaslikGorunsun" Type="Boolean" DefaultValue="False" />
            <asp:Parameter Name="Aciklama" Type="String" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="ContainerId" Type="Int16" />
            <asp:Parameter Name="GosterilecekSablonlarSql" Type="String" />
            <asp:Parameter Name="BlokType" Type="String" DefaultValue="Menu" />
        </InsertParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="Sdsicerikler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        DeleteCommand="DELETE FROM snlg_V1.TblMenuApp WHERE UCId = @UCId; DELETE FROM snlg_V1.TblUCApp WHERE UCId = @UCId AND BlokType = 'Menu'"
        SelectCommand="SELECT Title, UCId, Gorunurluk FROM snlg_V1.TblUCApp WHERE BlokType = 'Menu' ORDER BY Title" OnDeleted="Sdsicerikler_Deleted" OnDeleting="Sdsicerikler_Deleting"
        UpdateCommand="snlg_V1.msp_UCIcerikDuzenle" UpdateCommandType="StoredProcedure"
        OnUpdating="SdsIcerik_Updating" OnUpdated="SdsIcerik_Updated">
        <DeleteParameters>
            <asp:Parameter Name="UCId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="BaslikGorunsun" Type="Boolean" DefaultValue="False" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
            <snlg:ApplicationParameter Name="Dil" AppKeyName="DefaultLang" />
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="ContainerId" Type="Int16" />
            <asp:Parameter Name="GosterilecekSablonlarSql" Type="String" />
            <asp:Parameter Name="BlokUstBilgi" Type="String" />
            <asp:Parameter Name="BlokAltBilgi" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
