<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="poll-edit.aspx.cs" Inherits="admin_anketduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <div class="row anketDuzenle">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.poll_edit_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.poll_edit_help %></div>


            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">

                    <asp:LinkButton ID="ImageButton1" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet" OnClick="BtnKaydet_Click" ValidationGroup="ekle"></asp:LinkButton>
                    <asp:LinkButton ID="BtnKaydet2" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac" OnClick="BtnKaydet_Click" ValidationGroup="ekle"></asp:LinkButton>
                    <asp:LinkButton ID="BtnSil" runat="server" Text="<%$ Resources:admin_language, delete %>" class="btn btn-danger icon_sil" OnClick="BtnSil_Click" data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                    <a href="polls.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.poll_edit_form %></div>
                        <div class="panel-body">
                            <div class="form">
                                <asp:FormView ID="FVAnket" runat="server" DataKeyNames="AnketId" DataSourceID="SDSAnket"
                                    DefaultMode="Edit">
                                    <EditItemTemplate>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                            <div class="col-md-6">
                                                <%# DilleriListele(Eval("Diller")) %>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Soru") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" CssClass="hata"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_1 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("A") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox2" CssClass="hata"
                                                    Display="Dynamic" EnableViewState="False" ErrorMessage="*" ValidationGroup="ekle"
                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_2 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("B") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox3" CssClass="hata"
                                                    Display="Dynamic" EnableViewState="False" ErrorMessage="*" ValidationGroup="ekle"
                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_3 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("C") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_4 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("D") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_5 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T6" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("E") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_6 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("F") %>'></asp:TextBox>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_7 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T8" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("G") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_8 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T9" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("H") %>'></asp:TextBox>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_result_view %></label>
                                            <div class="col-md-6">
                                                <asp:CheckBox ID="CBSonuc" runat="server" Checked='<%# Bind("SonucGoster") %>' />
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                            <div class="col-md-6">
                                                <div class="gorunurluk">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                                        <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.article_add_date %></label>
                                            <div class="col-md-6">
                                                <%# Eval("Tarih", "{0:d}") %>
                                            </div>
                                        </div>

                                    </EditItemTemplate>
                                    <InsertItemTemplate>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T1" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Soru") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                                    Display="Dynamic" EnableViewState="False" ErrorMessage="*" ValidationGroup="ekle"
                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_1 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T2" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("A") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="T2" CssClass="hata"
                                                    Display="Dynamic" EnableViewState="False" ErrorMessage="*" ValidationGroup="ekle"
                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_2 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T3" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("B") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="T3" CssClass="hata"
                                                    Display="Dynamic" EnableViewState="False" ErrorMessage="*" ValidationGroup="ekle"
                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_3 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T4" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("C") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_4 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T5" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("D") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_5 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T6" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("E") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_6 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T7" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("F") %>'></asp:TextBox>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_7 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T8" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("G") %>'></asp:TextBox>
                                            </div>
                                        </div>


                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_8 %></label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="T9" CssClass="form-control" runat="server" MaxLength="150" Text='<%# Bind("H") %>'></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.poll_edit_quest_result_view %></label>
                                            <div class="col-md-6">
                                                <asp:CheckBox ID="CBSonuc" runat="server" Checked='<%# Bind("SonucGoster") %>' />
                                            </div>
                                        </div>

                                        <div class="row form-group no-gutter">
                                            <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                            <div class="col-md-6">
                                                <div class="gorunurluk">
                                                    <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                                        <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                        </div>

                                    </InsertItemTemplate>
                                </asp:FormView>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
    <asp:SqlDataSource ID="SDSAnket" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_AnketDetaySec" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_AnketOlustur" InsertCommandType="StoredProcedure"
        UpdateCommand="snlg_V1.msp_AnketDuzenle" UpdateCommandType="StoredProcedure"
        DeleteCommand="DELETE FROM snlg_V1.TblAnketDetay FROM snlg_V1.TblAnketDetay INNER JOIN snlg_V1.TblAnketApp ON snlg_V1.TblAnketDetay.AnketId = snlg_V1.TblAnketApp.AnketId WHERE (snlg_V1.TblAnketApp.AnketId = @AnketId) AND (snlg_V1.TblAnketDetay.Dil = @Dil)">
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="AnketId" Type="Int32" QueryStringField="aid" />
        </SelectParameters>
        <DeleteParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="AnketId" Type="Int32" QueryStringField="aid" />
        </DeleteParameters>
        <InsertParameters>

            <asp:Parameter Name="Soru" Type="String" />
            <asp:Parameter Name="A" Type="String" />
            <asp:Parameter Name="B" Type="String" />
            <asp:Parameter Name="C" Type="String" />
            <asp:Parameter Name="D" Type="String" />
            <asp:Parameter Name="E" Type="String" />
            <asp:Parameter Name="F" Type="String" />
            <asp:Parameter Name="G" Type="String" />
            <asp:Parameter Name="H" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="SonucGoster" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="AnketId" Type="Int32" QueryStringField="aid" />
            <asp:Parameter Name="Soru" Type="String" />
            <asp:Parameter Name="A" Type="String" />
            <asp:Parameter Name="B" Type="String" />
            <asp:Parameter Name="C" Type="String" />
            <asp:Parameter Name="D" Type="String" />
            <asp:Parameter Name="E" Type="String" />
            <asp:Parameter Name="F" Type="String" />
            <asp:Parameter Name="G" Type="String" />
            <asp:Parameter Name="H" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="SonucGoster" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
