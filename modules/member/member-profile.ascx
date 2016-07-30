<%@ Control Language="C#" AutoEventWireup="true" CodeFile="member-profile.ascx.cs"
    Inherits="modules_uyelik_uye_bilgileri" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="form-wrap" runat="server" id="divView">

    <div class="row">
        <div class="col-sm-4">
            <asp:Image ID="ImgRes" runat="server" CssClass="img-responsive" /></div>
        <div class="col-sm-8">
            <p><%= isim %></p>
            <p><% = UserName %></p>
            <p><%= ePosta %> </p>

        </div>
    </div>

    <asp:LinkButton runat="server" ID="LnkDuzenle" CssClass="btn btn-default" OnClick="Lnk_Click"><%=GetGlobalResourceObject("default", "uye_bilg_ascx_duzenle").ToString() %></asp:LinkButton>
</div>

<div class="form-wrap" runat="server" id="divEdit" visible="false">
    <div class="errors-out">
        <div class="errors-in">
        </div>
    </div>

    <div class="form-wrap">

        <div class="form-group">
            <asp:Image ID="Image1" runat="server" Style="height: 125px;" Visible="false" />
            <a class="btn btn-default btn-sm" href="javascript:;" onclick="javascript: $(this).next(':file:first').click();"><%=GetGlobalResourceObject("default", "uye_bilg_ascx_resim").ToString() %></a>
            <asp:FileUpload ID="FU1" runat="server" Style="display: none;" />
        </div>
        <div class="form-group">
            <label><% = UserName %></label>
        </div>
        <div class="form-group">
            <asp:TextBox runat="server" ID="TxtEPost" MaxLength="150" CssClass="form-control" placeholder="<%$ Resources:default, uye_bilg_ascx_eposta %>" required autocomplete autofocus />
        </div>
        <div class="form-group">
            <asp:TextBox runat="server" ID="TSifre" MaxLength="15" CssClass="form-control" placeholder="<%$ Resources:default, uye_bilg_ascx_sifre %>" required />
        </div>
        <div class="form-group">
            <asp:TextBox runat="server" ID="TSifre2" MaxLength="15" CssClass="form-control" placeholder="<%$ Resources:default, uye_bilg_ascx_sifre2 %>" required />
        </div>
        <div class="form-group">
            <asp:TextBox runat="server" ID="TAd" MaxLength="75" CssClass="form-control" placeholder="<%$ Resources:default, uye_bilg_ascx_isim %>" required />
        </div>




    </div>
    <a class="btn btn-danger" href='<%= Request.RawUrl %>'><%=GetGlobalResourceObject("default", "uye_profile_geri_don").ToString() %></a>
    <asp:LinkButton runat="server" ID="LinkKaydet" CssClass="btn btn-success" OnClick="LinkKaydet_Click"><%=GetGlobalResourceObject("default", "uye_bilg_ascx_kaydet").ToString() %></asp:LinkButton>

</div>




