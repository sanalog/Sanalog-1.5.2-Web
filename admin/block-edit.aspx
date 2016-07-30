<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="block-edit.aspx.cs" Inherits="admin_blok_duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //tüm şablonları seç / kaldır
            $("#a_selectAll").click(function () {
                $('#<%= FVIcerik.FindControl("List1").ClientID %>').each(function () {
                    $('#<%= FVIcerik.FindControl("List1").ClientID %> option').not(":first").attr("selected", "selected");
                    $(".DDLCont").removeAttr("disabled");
                });
            });
            $(".LnkKaldir").click(function () {
                $('#<%= FVIcerik.FindControl("List1").ClientID %>').each(function () {
                    $('#<%= FVIcerik.FindControl("List1").ClientID %> option').removeAttr("selected");
                });
            });


            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });

            $('.DDLCont').attr("disabled", "disabled");
            $('.List1').click(function () {
                if ($(this).val() != "")
                    $(".DDLCont").removeAttr("disabled");
                else
                    $('.DDLCont').attr("disabled", "disabled");
            });

            $(".icon_kaydet, .icon_kaydetyeniac").click(function (ev) {
                if (($('.List1').val() == '' || $('.List1').val() == null) && $('.DDLCont').val() != '') {
                    ev.preventDefault();
                    bootbox.alert("Şablon konumu seçtiniz fakat şablon seçmediniz!");
                }
                else if (($('.List1').val() != '' && $('.List1').val() != null) && $('.DDLCont').val() == '') {
                    ev.preventDefault();
                    bootbox.alert("Şablon seçtiniz fakat şablon konumu seçmediniz!");
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <div class="row blokDuzenle">
        <div class="col-md-12">

            <asp:FormView ID="FVIcerik" runat="server" DataKeyNames="UCId" DataSourceID="SdsIcerik"
                DefaultMode="Edit" OnDataBound="FVIcerik_DataBound" OnPageIndexChanging="FVIcerik_PageIndexChanging">
                <EditItemTemplate>
                    <div class="page-head-x4"><%# Eval("Title") %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.block_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton ID="LinkButton1" CommandName="Update" ValidationGroup="ekle" Text="<%$ Resources:admin_language, save %>" runat="server" class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" CommandName="Update" ValidationGroup="ekle" runat="server" class="btn btn-success icon_kaydetyeniac"> <%= Resources.admin_language.save_new %></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" CommandName="delete" Text="<%$ Resources:admin_language, delete %>" runat="server" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <asp:LinkButton ID="LnkKaldir" runat="server" Text="<%$ Resources:admin_language, block_edit_delete %>" OnClientClick="confirm('Blok tüm şablonlardan kaldırılacak. Onaylıyor musunuz?');" class="btn btn-info icon_sil LnkKaldir" OnClick="LnkKaldir_Click"></asp:LinkButton>
                            <a href="blocks.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>



                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.block_list %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                    <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %> </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBTitle" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBTitle" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="250" Text='<%# Bind("Baslik") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" Visible='<%# Request.QueryString["dil"] == Snlg_ConfigValues.defaultLangId %>'
                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_exp %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBTit" CssClass="form-control" runat="server" MaxLength="500" Text='<%# Bind("Aciklama") %>'></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_design %></label>
                                    <div class="col-md-6">

                                        <asp:ListBox ID="List1" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                            DataValueField="SablonId" Rows="8" SelectionMode="Multiple" CssClass="List1 form-control list"
                                            OnDataBound="List1_DataBound"></asp:ListBox>

                                        <p>
                                            <a id="a_selectAll" href="javascript:;" class="btn btn-sm btn-info"><%= Resources.admin_language.block_edit_design_select %></a>
                                        </p>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_place %></label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DDLCont" CssClass="DDLCont form-control" runat="server" DataSourceID="SDSContainers" DataTextField="Title"
                                            DataValueField="ContainerId" OnDataBound="DDL_DataBound">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_order %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language,products_error %>" MaximumValue="255" MinimumValue="0"
                                            Type="Integer" ValidationGroup="ekle" SetFocusOnError="true"></asp:RangeValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_name_view %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CB1" runat="server" Checked='<%# Bind("BaslikGorunsun") %>' />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-6">
                                        <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'
                                            CssClass="gorunurluk">
                                            <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="row form-group no-gutter galeri" style='<%= Request.QueryString["bt"] == "0" ? "display:none;": "" %>'>
                                    <div class="col-md-12">
                                        <label><%= Resources.admin_language.content %></label>
                                        <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                            CssClass="CKEditor" Text='<%# Bind("Icerik") %>'> </CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div style='<%= Request.QueryString["bt"] == "1" ? "display:none;": "" %>'>

                                    <div class="row form-group no-gutter galeri">
                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.block_edit_top_tx %></label>
                                            <CKEditor:CKEditorControl ID="CKEUstBilgi" runat="server" BasePath="/plugins/ckeditor/"
                                                CssClass="CKEditor" Text='<%# Bind("BlokUstBilgi") %>'> </CKEditor:CKEditorControl>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter galeri">
                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.block_edit_bot_tx %></label>
                                            <CKEditor:CKEditorControl ID="CKEAltBilgisi" runat="server" BasePath="/plugins/ckeditor/"
                                                CssClass="CKEditor" Text='<%# Bind("BlokAltBilgi") %>'> </CKEditor:CKEditorControl>
                                        </div>
                                    </div>



                                </div>


                            </div>


                        </div>
                    </div>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.block_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.block_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton ID="LinkButton4" CommandName="Insert" ValidationGroup="ekle" runat="server" Text="<%$ Resources:admin_language, save %>"
                                class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="blocks.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.block_list %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBTitle" CssClass="form-control" runat="server" MaxLength="100" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBTitle" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_add_name %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_exp %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TBTit" CssClass="form-control" runat="server" Text='<%# Bind("Aciklama") %>' MaxLength="500"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_design %></label>
                                    <div class="col-md-6">

                                        <asp:ListBox ID="List1" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                            DataValueField="SablonId" Rows="8" SelectionMode="Multiple" CssClass="List1 form-control list"
                                            OnDataBound="List1_DataBound"></asp:ListBox>

                                        <p>
                                            <a id="a_selectAll" href="javascript:;" class="btn btn-sm btn-info"><%= Resources.admin_language.block_edit_design_select %></a>
                                        </p>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_place %></label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="DDLCont" CssClass="DDLCont form-control" runat="server" DataSourceID="SDSContainers" DataTextField="Title"
                                            DataValueField="ContainerId" SelectedValue='<%# Bind("ContainerId") %>' OnDataBound="DDL_DataBound">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_edit_order %></label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language,products_error %>" MaximumValue="255" MinimumValue="0"
                                            Type="Integer" ValidationGroup="ekle" SetFocusOnError="true"></asp:RangeValidator>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-6"><%= Resources.admin_language.block_name_view %></label>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="CB1" runat="server" Checked='<%# Bind("BaslikGorunsun") %>' />
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

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <div class="col-md-12">
                                        <label><%= Resources.admin_language.block_content %></label>
                                        <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                            CssClass="CKEditor" Text='<%# Bind("Icerik") %>'> </CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSContainers" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT ContainerId, Title FROM snlg_V1.TblPlaceHolders ORDER BY Title">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SdsIcerik" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_UCIcerikSecDuzenle" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_UCIcerikOlustur" InsertCommandType="StoredProcedure"
        OnSelected="SdsIcerik_Selected"
        UpdateCommand="snlg_V1.msp_UCIcerikDuzenle" UpdateCommandType="StoredProcedure"
        DeleteCommand="DELETE FROM snlg_V1.TblUCDetay FROM snlg_V1.TblUCDetay INNER JOIN snlg_V1.TblUCApp ON snlg_V1.TblUCDetay.UCId = snlg_V1.TblUCApp.UCId WHERE (snlg_V1.TblUCApp.UCId = @UCId) AND (snlg_V1.TblUCDetay.Dil = @Dil)"
        OnInserted="SdsIcerik_Inserted" OnUpdated="SdsIcerik_Updated" OnInserting="SdsIcerik_Inserting"
        OnUpdating="SdsIcerik_Updating" OnDeleted="SdsIcerik_Deleted" OnDeleting="SdsIcerik_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
            <asp:QueryStringParameter Name="BlokType" Type="Int32" QueryStringField="bt" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="BlokType" Type="Int32" QueryStringField="bt" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="BaslikGorunsun" Type="Boolean" />
            <asp:Parameter Name="Aciklama" Type="String" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="ContainerId" Type="Int16" />
            <asp:Parameter Name="GosterilecekSablonlarSql" Type="String" />
            <asp:Parameter Name="BlokType" Type="String" DefaultValue="Content" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="BaslikGorunsun" Type="Boolean" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="ContainerId" Type="Int16" />
            <asp:Parameter Name="GosterilecekSablonlarSql" Type="String" />
            <asp:Parameter Name="BlokUstBilgi" Type="String" />
            <asp:Parameter Name="BlokAltBilgi" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SdsSablon" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="
SELECT DS.SablonId, DS.SablonAd + ISNULL(' (' + PH.Title + ')', '') AS SablonAd
FROM     snlg_V1.TblDesignSablonlar AS DS LEFT OUTER JOIN
                  snlg_V1.TblDesignSablonIcerik AS DSI ON DS.SablonId = DSI.SablonId AND DSI.UCId = @UCId LEFT OUTER JOIN
                  snlg_V1.TblPlaceHolders AS PH ON DSI.ContainerId = PH.ContainerId
ORDER BY SablonAd"
        CancelSelectOnNullParameter="false">
        <SelectParameters>
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="ucid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
