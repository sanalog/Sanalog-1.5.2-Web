<%@ Control Language="C#" AutoEventWireup="true" CodeFile="password-reset.ascx.cs" Inherits="modules_member_password_reset" %>
<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="errors-out">
    <div class="errors-in">
    </div>
</div>

<div class="form-wrap">
    <div class="form-group">
        <asp:TextBox runat="server" ID="TxtPassword" placeholder="<%$ Resources:default, uye_bilg_ascx_sifre %>" TextMode="Password" CssClass="form-control" required></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox runat="server" ID="TxtPassword2" placeholder="<%$ Resources:default, uye_bilg_ascx_sifre2 %>" TextMode="Password" CssClass="form-control" required></asp:TextBox>
    </div>
</div>
<div class="btn-group">
    <asp:Button runat="server" ID="BtnSifreSifirlama" CssClass="btn btn-success btn-lg"
        OnClick="BtnSifreSifirlama_Click" Text="<%$ Resources:default, uye_bilg_ascx_sifre_kaydet %>" />
</div>

<script type="text/javascript">
</script>
