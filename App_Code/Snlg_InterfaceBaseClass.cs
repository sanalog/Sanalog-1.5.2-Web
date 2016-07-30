using System;
using System.Web.UI;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using Snlg_DataBase;
using System.Threading;
using System.Globalization;
using System.Web.Configuration;
using System.Text;
using System.Xml;

public class Snlg_InterfaceBaseClass : Page
{
    protected Dictionary<string, PlaceHolder> Places = new Dictionary<string, PlaceHolder>();
    protected List<string> scriptsDosyasi = new List<string>();
    protected List<string> cssDosyasi = new List<string>();
    public string title = "";
    public string keyword = "";
    public string description = "";
    public StringBuilder SBJsKodlari = new StringBuilder();
    public Snlg_DBConnect vt = new Snlg_DBConnect(true);
    public bool arama_indexle = true;

    protected override void InitializeCulture()
    {
        //Snlg_MemberInfo.LoginDogrula();

        if (string.IsNullOrEmpty(Request.QueryString["sablonDesignId"]) && string.IsNullOrEmpty(Request.QueryString["sablonSenkr"]))
            try
            {
                Thread.CurrentThread.CurrentCulture = Thread.CurrentThread.CurrentUICulture = new CultureInfo(Request.RawUrl.Split('/')[1]);

                try
                {
                    Object o = vt.ScalarSorguCalistir("SELECT * FROM snlg_V1.TblDiller WHERE DId = " + Thread.CurrentThread.CurrentUICulture.LCID.ToString() + " AND Aktif = 1;", CommandType.Text);
                    if (o == null || o == DBNull.Value)
                        Response.RedirectPermanent("/" + Snlg_ConfigValues.defaultLang + "/" + Snlg_ConfigValues.startPage + Snlg_ConfigValues.urlExtension);
                }
                catch { }

                Snlg_ConfigValues.s_ZDilId = Thread.CurrentThread.CurrentUICulture.LCID.ToString();
            }
            catch { Response.RedirectPermanent("/" + Snlg_ConfigValues.defaultLang + "/" + Snlg_ConfigValues.startPage + Snlg_ConfigValues.urlExtension); }

        base.InitializeCulture();
    }
    protected override void OnPreInit(EventArgs e)
    {
        PHListOlustur(this);
        //ziyaretci sayfaya girince şablonId değeri query olarak geleceği için sayfa ziyaretçiye gösteriliyor.
        //PLACE HOLDERLAR SENKRONİZE EDİLYOR
        PHSenkronizeEt();

        ScriptOrCssFileImportHead("https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js");
        if (!string.IsNullOrEmpty(Request.QueryString["sablon"]))
        {
            IcerikGetir();

            //görünürlüğü kontrol et
            try
            {
                if (Request.QueryString["gorunurluk"] == "2" && string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()))
                {
                    vt.Kapat();
                    Snlg_Hata.ziyaretci.HataGosterUyari(GetGlobalResourceObject("default", "global_hatsa01").ToString(), true);
                    if (Request.UrlReferrer == null)
                        Response.Redirect("~/" + Request.RawUrl.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries)[0] + "/" + Snlg_ConfigValues.startPage + Snlg_ConfigValues.urlExtension, true);
                    else
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri, true);
                }
                else if (Request.QueryString["gorunurluk"] == "3" && !string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()))
                {
                    vt.Kapat();
                    Snlg_Hata.ziyaretci.HataGosterUyari(GetGlobalResourceObject("default", "global_hata02").ToString(), true);
                    if (Request.UrlReferrer == null)
                        Response.Redirect("~/" + Request.RawUrl.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries)[0] + "/" + Snlg_ConfigValues.startPage + Snlg_ConfigValues.urlExtension, true);
                    else
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri, true);
                }
            }
            catch { }
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["sablonDesignId"]))
        {//admin şablon dizaynı yapmak için bu querystringi kullanacak.
            FillPageForDesignMode();
        }
        base.OnPreInit(e);
    }
    protected override void OnInit(EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request.QueryString["sablonDesignId"]) && !IsPostBack)
        {
            
            ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/bootstrap.min.css");
            ScriptOrCssFileImportHead("/admin/common/css/sanalog.css");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/style.css");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "js/bootstrap.min.js");
            ScriptOrCssFileImportHead(Snlg_ConfigValues.AdminThemePath + "css/font-awesome.min.css");
        }

        if (!IsPostBack)
            Snlg_Hata.ziyaretci.hataRedirect = false;

        base.OnLoad(e);
    }
    protected override void OnPreRenderComplete(EventArgs e)
    {
        //title boşsa sayfa meta verilerini çek
        if (!string.IsNullOrEmpty(Request.QueryString["syf"]) && string.IsNullOrEmpty(this.title))
        {
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
            DBPrms[0] = new Snlg_DBParameter("@SayfaId", SqlDbType.Int, Request.QueryString["syf"]);

            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_SayfaMetaGetir", CommandType.StoredProcedure, DBPrms))
            {
                if (sdr.Read())
                {
                    this.keyword += sdr["Keyword"].ToString();
                    this.description += sdr["Descr"].ToString();
                    this.title += sdr["Title"].ToString();
                }
            }
        }

        Literal LtrHead = new Literal();

        StringBuilder SBTemp = new StringBuilder();

        //metaları ekle
        SBTemp.Append("<title>" + this.title + "</title>");
        SBTemp.Append("<meta name=\"keywords\" content=\"" + this.keyword + "\" />");
        SBTemp.Append("<meta name=\"description\" content=\"" + this.description + "\" />");
        if (!arama_indexle)
            SBTemp.Append("<meta name=\"robots\" content=\"noindex, nofollow\">");

        //scriptler ve css'ler import ediliyor
        foreach (string importPath in scriptsDosyasi)
            SBTemp.Append("<script type=\"text/javascript\" src=\"" + importPath + "\"></script>");
        foreach (string importPath in cssDosyasi)
            SBTemp.Append("<link href=\"" + importPath + "\" rel=\"stylesheet\" type=\"text/css\" />");

        //script kodları
        SBTemp.Append("<script type=\"text/javascript\">" + SBJsKodlari.ToString() + "</script>");
        SBTemp.Append(Snlg_ConfigValues.aramaMotoru);
        LtrHead.Text = SBTemp.ToString();
        this.Header.Controls.AddAt(0, LtrHead);

        if (!string.IsNullOrEmpty(Snlg_Hata.ziyaretci.hataScript))
        {
            if (!Snlg_Hata.ziyaretci.hataRedirect)
            {//hata göster
                HtmlGenericControl hataJs = new HtmlGenericControl("script");
                hataJs.Attributes.Add("type", "text/javascript");
                hataJs.InnerHtml += "$(document).ready(function () {";
                hataJs.InnerHtml += "$('.errors-out').css('display', 'block');";
                hataJs.InnerHtml += Snlg_Hata.ziyaretci.hataScript;
                hataJs.InnerHtml += "});";
                this.Page.Header.Controls.Add(hataJs);

                Snlg_Hata.ziyaretci.hataScript = "";
            }
        }

        base.OnPreRenderComplete(e);
    }
    public override void Dispose()
    {
        try { vt.Kapat(); }
        catch { }
        base.Dispose();
    }


    protected void IcerikGetir()
    {
        foreach (KeyValuePair<string, PlaceHolder> item in Places)
            ContainerleriGizle(item.Value.Parent);

        try
        {
            #region parametreler
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[3];
            DBPrms[0] = new Snlg_DBParameter("@isLogin", SqlDbType.Bit, !string.IsNullOrEmpty(Snlg_MemberInfo.s_UserId.ToString()));
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);
            DBPrms[2] = new Snlg_DBParameter("@SablonId", SqlDbType.SmallInt, Request.QueryString["sablon"]);

            if (string.IsNullOrEmpty(Request.QueryString["sablon"]))
                DBPrms[2].Deger = DBNull.Value;
            #endregion

            DataSet DSSablonIcerik = vt.DataSetOlustur("snlg_V1.zsp_SablondakiKontrolleriGetir", CommandType.StoredProcedure, DBPrms);
            DataTable DtKontroller = DSSablonIcerik.Tables[0];
            DataTable DTBlockAttributes = DSSablonIcerik.Tables[1];
            foreach (DataRow drUc in DtKontroller.Select("", "Sira"))
            {
                HtmlGenericControl divBlokParent = new HtmlGenericControl("div");

                if (!string.IsNullOrEmpty(drUc["UCPath"].ToString()))
                {//demekk user control 
                    try
                    {
                        Snlg_UserControlBaseClass uc = (Snlg_UserControlBaseClass)LoadControl("~/modules/" + drUc["UCPath"].ToString() + ".ascx");
                        //uc.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
                        uc.baslikGorunsun = Convert.ToBoolean(drUc["BaslikGorunsun"]);
                        uc.baslik = drUc["UCBaslik"].ToString();
                        uc.UserControlClientID = "UC-" + drUc["BlockPlaceID"].ToString();
                        ContainerGoster(Places[drUc["PHName"].ToString()].Parent);

                        foreach (DataRow drAttribute in DTBlockAttributes.Select("BlockPlaceID = " + drUc["BlockPlaceID"].ToString()))
                        {
                            if (!uc.BlockAttributes.ContainsKey(drAttribute["AttributeKey"].ToString()))
                                uc.BlockAttributes.Add(drAttribute["AttributeKey"].ToString(), drAttribute["AttributeValue"].ToString());

                        }

                        Literal ltrlUst = new Literal();
                        ltrlUst.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
                        ltrlUst.Text = drUc["BlokUstBilgi"].ToString();

                        Literal ltrlAlt = new Literal();
                        ltrlAlt.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
                        ltrlAlt.Text = drUc["BlokAltBilgi"].ToString();

                        divBlokParent.Attributes.Add("class", "modules " + uc.UserControlCssClass);
                        divBlokParent.Attributes.Add("id", uc.UserControlClientID);
                        divBlokParent.Controls.Add(ltrlUst);
                        divBlokParent.Controls.Add(uc);
                        divBlokParent.Controls.Add(ltrlAlt);
                        Places[drUc["PHName"].ToString()].Controls.Add(divBlokParent);
                    }
                    catch (Exception exc)
                    { Snlg_Hata.ziyaretci.ExceptionLogla(exc); }
                }
                else if (drUc["BlokType"].ToString() == "Content")
                {//demekki adminde oluşturulmuş bir içerik
                    try
                    {
                        StringBuilder SBBlokHtml = new StringBuilder();

                        if (Convert.ToBoolean(drUc["BaslikGorunsun"]))
                            SBBlokHtml.Append("<h4>" + drUc["UCBaslik"].ToString() + "</h4>");
                        SBBlokHtml.Append(drUc["UCIcerik"].ToString());

                        GeleriEmbed(SBBlokHtml, vt);
                        ContainerGoster(Places[drUc["PHName"].ToString()].Parent);
                        Literal ltrl = new Literal();
                        //ltrl.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
                        ltrl.Text = SBBlokHtml.ToString();

                        divBlokParent.Attributes.Add("class", "snlg-block-" + classReplace(drUc["Title"].ToString()));
                        divBlokParent.Controls.Add(ltrl);
                        Places[drUc["PHName"].ToString()].Controls.Add(divBlokParent);
                    }
                    catch (Exception exc)
                    { Snlg_Hata.ziyaretci.ExceptionLogla(exc); }
                }
                else if (drUc["BlokType"].ToString() == "Menu")
                {//demekki adminde oluşturulmuş bir içerik
                    try
                    {
                        Dictionary<string, string> BlockAttributes = new Dictionary<string, string>();
                        foreach (DataRow drAttribute in DTBlockAttributes.Select("BlockPlaceID = " + drUc["BlockPlaceID"].ToString()))
                        {
                            if (!BlockAttributes.ContainsKey(drAttribute["AttributeKey"].ToString()))
                                BlockAttributes.Add(drAttribute["AttributeKey"].ToString(), drAttribute["AttributeValue"].ToString());
                        }

                        string menuType = "Top";
                        try
                        { menuType = BlockAttributes["MenuType"]; }
                        catch { }

                        string menuClass = "snlg-block-menu-" + classReplace(menuType) + " " + classReplace(drUc["Title"].ToString());

                        //memülar alınıyor
                        DataTable DTMenu = vt.DataTableOlustur("snlg_V1.zsp_Menuler", CommandType.StoredProcedure, new Snlg_DBParameter[2] { new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId), new Snlg_DBParameter("@UCID", SqlDbType.Int, drUc["UCId"].ToString()) });

                        //memü yoksa gizle
                        if (DTMenu.Rows.Count > 0)
                        {
                            //memülar listeleniyor
                            StringBuilder SBBlokHtml = new StringBuilder();
                            //ilk başta üst ID si null olanlar gönderiliyor.
                            MenuleriDoldur(DTMenu, SBBlokHtml, DTMenu.Select("UstId IS NULL", "Sira"), menuType);

                            ContainerGoster(Places[drUc["PHName"].ToString()].Parent);
                            Literal ltrl = new Literal();
                            ltrl.Text = SBBlokHtml.ToString();

                            divBlokParent.Attributes.Add("class", menuClass);
                            divBlokParent.Controls.Add(ltrl);

                            Places[drUc["PHName"].ToString()].Controls.Add(divBlokParent);
                        }
                    }
                    catch (Exception exc)
                    { Snlg_Hata.ziyaretci.ExceptionLogla(exc); }
                }
            }
        }
        catch (Exception exc)
        { Snlg_Hata.ziyaretci.ExceptionLogla(exc); }
    }
    protected void PHSenkronizeEt()
    {
        if (Request.QueryString["sablonSenkr"] != "1")
            return;

        foreach (KeyValuePair<string, PlaceHolder> item in Places)
        {
            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[0] = new Snlg_DBParameter("@Title", SqlDbType.VarChar, item.Value.ID, 100);
            DBPrms[1] = new Snlg_DBParameter("@PHName", SqlDbType.VarChar, item.Value.ID, 100);

            vt.SorguCalistir("snlg_V1.msp_PlaceHolderEkle", CommandType.StoredProcedure, DBPrms);
        }

        string silinecek = "";
        using (SqlDataReader sdr = vt.DBReaderOlustur("SELECT PHName, ContainerId FROM snlg_V1.TblPlaceHolders", System.Data.CommandType.Text))
        {
            while (sdr.Read())
            {
                if (!Places.ContainsKey(sdr["PHName"].ToString()))
                    silinecek += sdr["ContainerId"].ToString() + ",";
            }
            silinecek = silinecek.TrimEnd(',');
        }
        if (!string.IsNullOrEmpty(silinecek))
            vt.SorguCalistir("DELETE FROM snlg_V1.TblPlaceHolders WHERE ContainerId IN (" + silinecek + ")", System.Data.CommandType.Text);
        vt.Kapat();
        Response.Clear();
        Response.End();
    }
    protected void PHListOlustur(Control _c)
    {
        foreach (Control c in _c.Controls)
        {
            if (c.GetType() == typeof(PlaceHolder))
                if (c.ID.Substring(0, 5) == "snlg_")
                    Places.Add(c.ID, (PlaceHolder)c);

            PHListOlustur(c);
        }
    }
    private void FillPageForDesignMode()
    {
        //eğer bu kullanıcı admin değilse tasarım yapmasını engelle
        if (Snlg_MemberInfo.s_UserId != Snlg_ConfigValues.AdminId)
        {
            if (!Snlg_MemberInfo.s_YetkiSayfalar.Contains("sablonDuzenle,"))
            {
                vt.Kapat();
                Response.Clear();
                Response.End();
                return;
            }
        }

        this.FindControl("designControls").Visible = true;
        ((LinkButton)this.FindControl("BtnKaydet")).Click += new EventHandler(BtnSablonKaydet_Click);
        if (!IsPostBack)
        {
            DataTable DTBlockAttributes = vt.DataTableOlustur(@"
SELECT DISTINCT ISNULL(BAV.AttributeValue, BAK.DefaultValue) AS AttributeValue, BAK.AttributeKey, BAK.AttributeID, DSI.BlockPlaceID, 
        BAK.BlockID, BAK.ValueList
FROM     snlg_V1.TblBlockAttributeKeys AS BAK LEFT JOIN
	snlg_V1.TblDesignSablonIcerik AS DSI ON DSI.UCId = BAK.BlockID and DSI.SablonId = " + Request.QueryString["sablonDesignId"] + @" LEFT OUTER JOIN
	snlg_V1.TblBlockAttributeValues AS BAV ON BAK.AttributeID = BAV.AttributeID AND DSI.BlockPlaceID = BAV.BlockPlaceID
", CommandType.Text);
            Dictionary<string, HtmlGenericControl> containers = new Dictionary<string, HtmlGenericControl>();

            #region container'ler place holderlara yerleştiriliyor.
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_SablonPHList", CommandType.StoredProcedure))
            {
                while (sdr.Read())
                {
                    string s = sdr["PHName"].ToString();
                    //containerin title ve açıklama oluşturulyor
                    HtmlGenericControl Column = new HtmlGenericControl("div");
                    Column.Attributes["class"] = "column";
                    Places[sdr["PHName"].ToString()].Controls.Add(Column);

                    HtmlGenericControl divColumnTop = new HtmlGenericControl("div");
                    divColumnTop.Attributes["class"] = "columnHead";
                    divColumnTop.InnerHtml = "<span class=\"columnTitle\">" + sdr["Title"].ToString() + "</span><span class=\"columnDescr\">" + sdr["Title"].ToString() + "</span>";
                    Places[sdr["PHName"].ToString()].Controls.Add(divColumnTop);

                    //container için parent div oluşturulyor
                    HtmlGenericControl parentDiv = new HtmlGenericControl("div");
                    parentDiv.Attributes["class"] = "columnParent";
                    Places[sdr["PHName"].ToString()].Controls.Add(parentDiv);

                    //container div tanımlanıyor ve listeye ekleniyor
                    HtmlGenericControl containerDiv = new HtmlGenericControl("div");
                    containerDiv.Attributes["id"] = "C-" + sdr["ContainerId"].ToString();
                    containerDiv.Attributes["class"] = "columnMain";
                    containerDiv.Attributes["ondragover"] = "isAllowDrop(event)";
                    containerDiv.Attributes["ondrop"] = "onDrop(event)";
                    containers.Add(sdr["ContainerId"].ToString(), containerDiv);

                    //container sayfadaki yerine ekleniyor
                    Column.Controls.Add(divColumnTop);
                    Column.Controls.Add(parentDiv);
                    parentDiv.Controls.Add(containerDiv);
                }
            }
            #endregion

            #region container'larda bulunan control'ler ekleniyor
            using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.msp_SablonDizaynControlList", CommandType.StoredProcedure, new Snlg_DBParameter[1] { new Snlg_DBParameter("@SablonId", SqlDbType.Int, Request.QueryString["sablonDesignId"]) }))
            {
                while (sdr.Read())
                {
                    //control hazırlanıyor
                    HtmlGenericControl divUC = new HtmlGenericControl("div");
                    divUC.Attributes.Add("id", "divUC" + sdr["UCId"].ToString());
                    divUC.Attributes.Add("data-blockPlaceid", sdr["BlockPlaceID"].ToString());
                    divUC.Attributes.Add("data-ucid", sdr["UCID"].ToString());
                    divUC.Attributes.Add("class", "box border primary design-panel");
                    divUC.Attributes.Add("ondragstart", "onDragStart(event)");
                    divUC.Attributes.Add("draggable", "true");

                    DataRow[] drAttrCol;
                    string blockAttribute = "";
                    if (!string.IsNullOrEmpty(sdr["BlockPlaceID"].ToString()))
                        drAttrCol = DTBlockAttributes.Select("BlockPlaceID = " + sdr["BlockPlaceID"].ToString());
                    else
                        drAttrCol = DTBlockAttributes.Select("BlockID = " + sdr["UCID"].ToString());

                    if (drAttrCol.Length > 0)
                    {
                        blockAttribute = "<ul>";
                        foreach (DataRow drAttr in drAttrCol)
                        {
                            blockAttribute += string.Format(@"<li>{0} : ", drAttr["AttributeKey"].ToString());
                            string[] options = drAttr["ValueList"].ToString().Split(',');
                            if (options.Length > 0)
                            {
                                blockAttribute += string.Format("<select class='form-control' data-attr-id='{0}' >", drAttr["AttributeID"].ToString());
                                foreach (string option in options)
                                    blockAttribute += string.Format(@"<option value=""{0}"" {1}>{0}</option>", Server.HtmlEncode(option), (drAttr["AttributeValue"].ToString().Trim() == option.Trim() ? "selected" : ""));
                                blockAttribute += "</select>";
                            }
                            blockAttribute += "</li>";
                        }
                        blockAttribute += "</ul>";
                    }

                    string bloktype = sdr["BlokType"].ToString().Replace("User Control", "0").Replace("Content", "1").Replace("Menu", "2");

                    //control'ün içeriği hazırlanıyor
                    divUC.InnerHtml += string.Format(@"
<div class='box-title'>
    <h4>{0}</h4>
    <div class='tools hidden-xs'>
        <a href='javascript:;' class='collapse openBlok'><i class='fa fa-chevron-down'></i></a>
                     <a href='/admin/{3}.aspx?dil={4}&ucid={1}&bt={2}' class='editBlok' target='_blank' title='Bloğu Düzenle'><i class='fa fa-pencil-square-o fa-1x'></i></a>
            <a href='/admin/block-attributes.aspx?ucid={1}' target='_blank' title='Nitelikleri Düzenle'><i class='fa fa-cog fa-1x'></i></a>
<a href='javascript:;'><i class='closeBlok fa fa-times' rel='divUC{1}' title='Bloğu sayfadan kaldır'></i></a>
  </div>
    <div class='box-body big' style='display:none;'>
" + blockAttribute + @"
    </div>
</div>", sdr["Title"].ToString(), sdr["UCId"].ToString(), bloktype, (bloktype == "2" ? "menu-groups" : "block-edit"), Snlg_ConfigValues.defaultLangId);

                    //sıralama null ise sayfada bulunmadığı için null'dur. dolayısıyla Controls'e ekleniyor.
                    if (string.IsNullOrEmpty(sdr["ContainerId"].ToString()))
                        this.FindControl("designControlsBox").Controls.Add(divUC);
                    else
                    {//sıralama null değilse float ayarla ve ekle
                        containers[sdr["ContainerId"].ToString()].Controls.Add(divUC);
                    }
                }
            }
            #endregion
        }
    }
    protected void BtnSablonKaydet_Click(object sender, EventArgs e)
    {
        //eğer şablonID girilmemişse metoddan çık
        if (string.IsNullOrEmpty(Request.QueryString["sablonDesignId"]))
            return;

        try
        {
            StringBuilder SBSorgu = new StringBuilder();
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(Request.Form["HdnContainers"]);
            XmlNodeList xContainers = xDoc.SelectNodes("//containers/container");

            //dizaynı boşalt
            SBSorgu.Append("DECLARE @InsertedBlockPlaceID int");
            SBSorgu.Append(Environment.NewLine);
            SBSorgu.Append("DELETE FROM snlg_V1.TblDesignSablonIcerik WHERE (SablonId = " + Request.QueryString["sablonDesignId"] + ");");
            SBSorgu.Append(Environment.NewLine);
            //nitelikleri boşalt
            SBSorgu.Append(@"
DELETE FROM snlg_V1.TblBlockAttributeValues
FROM snlg_V1.TblBlockAttributeValues INNER JOIN
        snlg_V1.TblDesignSablonIcerik ON snlg_V1.TblBlockAttributeValues.BlockPlaceID = snlg_V1.TblDesignSablonIcerik.BlockPlaceID
WHERE  (snlg_V1.TblDesignSablonIcerik.SablonId = " + Request.QueryString["sablonDesignId"] + ");");
            //nitelikleri boşalt
            foreach (XmlNode xContainer in xContainers)
            {//container'lar dönülüyor
                if (xContainer.Attributes["id"].Value != "designControlsBox")
                {//şablona yerleştirilen kontroller dönülüyor
                    XmlNodeList xControls = xContainer.SelectNodes("uc");
                    for (int i = 0; i < xControls.Count; i++)
                    {//eğer bu kontrol önceden kullanılan bir kontrolse tablodan sil (çünkü boşda)
                        XmlNode xControl = xControls[i];
                        SBSorgu.AppendFormat("INSERT INTO snlg_V1.TblDesignSablonIcerik (SablonId,ContainerId,UCId,Sira) VALUES ({0},{1},{2},{3}); ", Request.QueryString["sablonDesignId"], xContainer.Attributes["id"].Value, xControl.Attributes["ucid"].Value, i.ToString());

                        SBSorgu.Append(Environment.NewLine);
                        SBSorgu.Append("SET @InsertedBlockPlaceID = SCOPE_IDENTITY()");
                        SBSorgu.Append(Environment.NewLine);

                        XmlNodeList xAttrs = xControl.SelectNodes("attr");
                        foreach (XmlNode xAttr in xAttrs)
                            SBSorgu.AppendFormat("INSERT INTO snlg_V1.TblBlockAttributeValues (AttributeID, BlockPlaceID, AttributeValue) VALUES ('{0}', @InsertedBlockPlaceID, '{1}'); ", xAttr.Attributes["attrid"].Value, Server.HtmlDecode(xAttr.Attributes["value"].Value));
                    }
                }
            }

            SBSorgu.Append(@"
DELETE FROM snlg_V1.TblBlockAttributeValues
FROM snlg_V1.TblBlockAttributeValues INNER JOIN
        snlg_V1.TblBlockAttributeKeys ON snlg_V1.TblBlockAttributeValues.AttributeID = snlg_V1.TblBlockAttributeKeys.AttributeID AND 
        snlg_V1.TblBlockAttributeKeys.DefaultValue = snlg_V1.TblBlockAttributeValues.AttributeValue");
            vt.SorguCalistir(SBSorgu.ToString(), CommandType.Text);
            vt.Kapat();
            Snlg_Hata.ziyaretci.HataGosterBasarili("Değişiklikler kaydedildi.", true);
        }
        catch (Exception exc)
        {
            vt.Kapat();
            Snlg_Hata.ziyaretci.ExceptionLogla(exc);
            Snlg_Hata.ziyaretci.HataGosterHatali(exc.Message.Replace("'", "") + GetGlobalResourceObject("admin_language", "eror_unexcepted"), true);
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }


    protected void MenuleriDoldur(DataTable DTMenu, StringBuilder SBMenu, DataRow[] DRC, string menuType)
    {
        if (DRC.Length < 1)
            return;

        #region nav menü
        if (menuType == "Top")
        {
            if (DRC[0]["UstId"] == DBNull.Value)
                SBMenu.Append("<ul id=\"navbar\" class=\"navbar-nav nav collapse navbar-collapse\">");
            else
                SBMenu.Append("<ul class=\"dropdown-menu\">");

            for (int i = 0; i < DRC.Length; i++)
            {
                DataRow[] drSubs = DTMenu.Select("UstId = " + DRC[i]["MenuId"].ToString(), "Sira");
                string toogle = "", arrow = "";
                if (drSubs.Length > 0)
                {
                    toogle = "data-toggle=\"dropdown\"";
                    if (!string.IsNullOrEmpty(DRC[i]["UstID"].ToString()))
                        arrow = "<i class='fa fa-angle-right'></i>";
                }

                string link = "";
                if (DRC[i]["MenuLink"].ToString().Contains("http") || DRC[i]["MenuLink"].ToString().Contains("//"))
                    link = DRC[i]["MenuLink"].ToString();
                else if (string.IsNullOrEmpty(DRC[i]["MenuLink"].ToString().Replace("#", "")))
                    link = "#";
                else
                    link = "/" + Snlg_ConfigValues.s_Dil + DRC[i]["MenuLink"].ToString();

                SBMenu.AppendFormat("<li class=\"dropdown\"><a class=\"dropdown-toggle\" " + toogle + " href=\"{0}\" target=\"{1}\">", link + Snlg_ConfigValues.urlExtension, DRC[i]["Hedef"].ToString());
                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("{0}</a>{1}", DRC[i]["MenuItem"].ToString(), arrow);
                MenuleriDoldur(DTMenu, SBMenu, drSubs, menuType);
                SBMenu.Append("</li>");
            }
            SBMenu.Append("</ul>");
        }
        #endregion

        #region left , right menü
        if (menuType == "Left" || menuType == "Right")
        {
            if (DRC[0]["UstId"] == DBNull.Value)
                SBMenu.Append("<ul data-snlg='menu'>");
            else
                SBMenu.Append("<ul>");

            for (int i = 0; i < DRC.Length; i++)
            {
                DataRow[] drSubs = DTMenu.Select("UstId = " + DRC[i]["MenuId"].ToString(), "Sira");
                {
                    if (drSubs.Length > 0)
                    {
                        SBMenu.Append("<li>");
                        if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                            SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                        SBMenu.AppendFormat("<a href=\"javascript:;\">{0}</a><i class='fa fa-angle-right'></i>", DRC[i]["MenuItem"].ToString());

                    }
                    else
                    {
                        string link = "";
                        if (DRC[i]["MenuLink"].ToString().Contains("http") || DRC[i]["MenuLink"].ToString().Contains("//"))
                            link = DRC[i]["MenuLink"].ToString();
                        else if (string.IsNullOrEmpty(DRC[i]["MenuLink"].ToString().Replace("#", "")))
                            link = "#";
                        else
                            link = "/" + Snlg_ConfigValues.s_Dil + DRC[i]["MenuLink"].ToString();

                        SBMenu.Append("<li>");
                        if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                            SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());

                        SBMenu.AppendFormat(@"<a href='{0}' target='{1}'>{2}</a>", link, DRC[i]["Hedef"].ToString(), DRC[i]["MenuItem"].ToString());
                    }

                    MenuleriDoldur(DTMenu, SBMenu, drSubs, menuType);
                    SBMenu.Append("</li>");
                }
            }

            SBMenu.Append("</ul>");
        }
        #endregion

        #region FOOTER MENÜ
        if (menuType == "Footer")
        {
            SBMenu.Append("<ul>");

            for (int i = 0; i < DRC.Length; i++)
            {
                DataRow[] drSubs = DTMenu.Select("UstId = " + DRC[i]["MenuId"].ToString(), "Sira");

                string link = "";
                if (DRC[i]["MenuLink"].ToString().Contains("http") || DRC[i]["MenuLink"].ToString().Contains("//"))
                    link = DRC[i]["MenuLink"].ToString();
                else if (string.IsNullOrEmpty(DRC[i]["MenuLink"].ToString().Replace("#", "")))
                    link = "#";
                else
                    link = "/" + Snlg_ConfigValues.s_Dil + DRC[i]["MenuLink"].ToString();

                SBMenu.Append("<li>");
                SBMenu.AppendFormat("<a href=\"{0}\" target=\"{1}\">", link, DRC[i]["Hedef"].ToString());
                if (!string.IsNullOrEmpty(DRC[i]["Resim"].ToString()))
                    SBMenu.AppendFormat("<img src=\"{0}\"/>", DRC[i]["Resim"].ToString());
                SBMenu.AppendFormat("{0}</a>", DRC[i]["MenuItem"].ToString());

                MenuleriDoldur(DTMenu, SBMenu, drSubs, menuType);
                SBMenu.Append("</li>");
            }
            SBMenu.Append("</ul>");
        }
        #endregion

    }

    private void ContainerleriGizle(Control c)
    {
        if (c.GetType().Name == "HtmlForm")
            return;

        if (c.GetType().Name == "HtmlGenericControl")
        {
            c.Visible = false;
            ContainerleriGizle(c.Parent);
        }
    }
    private void ContainerGoster(Control c)
    {
        if (c.GetType().Name == "HtmlForm")
            return;

        if (c.GetType().Name == "HtmlGenericControl")
        {
            c.Visible = true;
            ContainerGoster(c.Parent);
        }
    }

    public void ScriptOrCssFileImportHead(string yol)
    {
        if (Path.GetExtension(yol) == ".js")
        {
            if (!scriptsDosyasi.Contains(yol))
                scriptsDosyasi.Add(yol);
        }
        else if (Path.GetExtension(yol) == ".css")
        {
            if (!cssDosyasi.Contains(yol))
                cssDosyasi.Add(yol);
        }
    }
    public void ScriptOrCssFileImportHead(string yol, string tip)
    {
        if (tip == "js")
        {
            if (!scriptsDosyasi.Contains(yol))
                scriptsDosyasi.Add(yol);
        }
        else if (tip == "css")
        {
            if (!cssDosyasi.Contains(yol))
                cssDosyasi.Add(yol);
        }
    }

    public void ScriptOrCssFileImportAfterBody(string yol)
    {
        if (!scriptsDosyasi.Contains(yol))
            ((Literal)Page.FindControl("LtrScriptFile")).Text += "<script src='" + yol + "' type='text/javascript'></script>";
    }


    public void GeleriEmbed(StringBuilder SBicerik, Snlg_DBConnect vt)
    {
        Snlg_ImageGallery rg = new Snlg_ImageGallery();
        rg.GeleriEmbed(SBicerik, vt, this);
    }

    public string classReplace(string metin)
    {
        metin = metin.Replace("İ", "I");
        metin = metin.Replace("Ç", "C");
        metin = metin.Replace("Ğ", "G");
        metin = metin.Replace("Ö", "O");
        metin = metin.Replace("Ü", "U");
        metin = metin.Replace("Ş", "S");
        metin = metin.Replace(".", "-");
        metin = metin.Replace("/", "-");

        metin = metin.Replace("ı", "i");
        metin = metin.Replace("ç", "c");
        metin = metin.Replace("ğ", "g");
        metin = metin.Replace("ö", "o");
        metin = metin.Replace("ü", "u");
        metin = metin.Replace("ş", "s");

        metin = metin.Replace(" ", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");
        metin = metin.Replace("--", "-");

        CultureInfo culture = new CultureInfo("en-US");
        metin = metin.ToLower().ToString(culture);

        return metin;
    }
}

