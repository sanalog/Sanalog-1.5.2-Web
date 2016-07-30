<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="block-attributes.aspx.cs" Inherits="admin_block_attributes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

                        $('body').on("click", ".table tr", function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
                }
            });

        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.block_att_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.block_att_help %>
               
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    
                    <asp:FormView ID="FVSyf" runat="server" DataSourceID="SDSSyflar"
                        DefaultMode="Insert">
                        <InsertItemTemplate>

                            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                                <div class="col-md-12">
                                    <asp:LinkButton CommandName="Insert" ValidationGroup="ekle" runat="server"
                                        alt="Ekle" Text="<%$ Resources:admin_language,save %>" class="btn btn-info icon_kaydet"> </asp:LinkButton>
                                     <a href="menu-groups.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                                   
                                </div>
                            </div>

                            <div class="panel">
                                <div class="panel-heading"><%= Resources.admin_language.block_att_add %></div>
                                <div class="panel-body">

                                    <div class="col-md-6">
                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.block_att_name %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("AttributeKey") %>'
                                                    MaxLength="250" CausesValidation="True" ValidationGroup="edit"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.block_att_value %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T2" CssClass="form-control" runat="server" Text='<%# Bind("DefaultValue") %>'
                                                    CausesValidation="True" ValidationGroup="edit"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="T2" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.block_att_add_value %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TBValueList" CssClass="form-control" runat="server" Text='<%# Bind("ValueList") %>'
                                                    CausesValidation="True" ValidationGroup="edit"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBValueList" CssClass="hata"
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
 <asp:LinkButton ValidationGroup="edit" runat="server" Text="<%$ Resources:admin_language, block_att_update %>" CausesValidation="false" alt="Tablodaki değişiklikleri günceller" class="btn btn-info icon_kaydet mb-md"
                                        OnClick="LinkEdit_Click"></asp:LinkButton>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.block_att %></div>
                        <div class="panel-body">
                            <asp:GridView ID="GVSyf" runat="server" class="table table-bordered table-striped"
                                AutoGenerateColumns="False" DataKeyNames="AttributeId" DataSourceID="SDSSyflar" GridLines="None">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CommandName="Delete" runat="server"   Text="<%$ Resources:admin_language, delete %>" 
                                                data-bb="confirm" data-confirm-text="Bu niteliği sildiğiniz takdirde bu blokdaki tüm değerleri kaldırılacaktır. Onaylıyor musunuz?" 
                                                class="btn btn-danger icon_sil"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language,block_att_name %>" >
                                        <ItemTemplate>
                                            <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("AttributeKey") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="edit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language,block_att_value %>">
                                        <ItemTemplate>
                                            <asp:TextBox ID="T2" CssClass="form-control" runat="server" Text='<%# Bind("DefaultValue") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="T2" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="edit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language,block_att_add_value %>">
                                        <ItemTemplate>
                                            <asp:TextBox ID="T3" CssClass="form-control" runat="server" Text='<%# Bind("ValueList") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="T3" CssClass="hata"
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
    <asp:SqlDataSource ID="SDSSyflar" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT * FROM snlg_V1.TblBlockAttributeKeys WHERE  (BlockID = @BlockID)"
        InsertCommand="INSERT INTO snlg_V1.TblBlockAttributeKeys (BlockID, AttributeKey, DefaultValue, ValueList) VALUES(@BlockID, @AttributeKey, @DefaultValue, @ValueList)"
        OnInserted="SDSSyflar_Inserted" OnInserting="SDSSyflar_Inserting"
        UpdateCommand="UPDATE snlg_V1.TblBlockAttributeKeys SET AttributeKey=@AttributeKey, DefaultValue=@DefaultValue, ValueList = @ValueList WHERE AttributeID=@AttributeID"
        DeleteCommand="DELETE FROM snlg_V1.TblBlockAttributeKeys WHERE  (AttributeID = @AttributeID)"
        OnDeleted="SDSSyflar_Deleted" OnDeleting="SDSSyflar_Deleting">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="ucid" Name="BlockID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:QueryStringParameter QueryStringField="ucid" Name="BlockID" Type="Int32" />
            <asp:Parameter Name="AttributeKey" Type="String" />
            <asp:Parameter Name="DefaultValue" Type="String" />
            <asp:Parameter Name="AttributeID" Type="Int32" />
            <asp:Parameter Name="islem" Type="Byte" DefaultValue="1" />
        </InsertParameters>
        <UpdateParameters>
            <asp:QueryStringParameter QueryStringField="ucid" Name="BlockID" Type="Int32" />
            <asp:Parameter Name="AttributeKey" Type="String" />
            <asp:Parameter Name="DefaultValue" Type="String" />
            <asp:Parameter Name="AttributeID" Type="Int32" />
            <asp:Parameter Name="islem" Type="Byte" DefaultValue="2" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="AttributeID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
