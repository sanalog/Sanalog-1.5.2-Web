using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Xml;
using Snlg_DataBase;
using System.Web;

public class Snlg_ImageGallery
{
    public void GeleriEmbed(StringBuilder SBicerik, Snlg_DBConnect vt, Snlg_InterfaceBaseClass pg)
    {
        byte x = 0;

        while (SBicerik.ToString().Contains("image_gallery") && x < 20)
        {
            x++;//metinde image_gallery kelimesi geçiyorsa sonsuz döngüye girmemesi için en fazla 30 kez dönülüyor
            int galleryPosition = SBicerik.ToString().IndexOf("image_gallery");
            int tagPositionStart = SBicerik.ToString().LastIndexOf("<img", galleryPosition);
            int tagPositionEnd = SBicerik.ToString().IndexOf("/>", tagPositionStart) + 2;
            string tag = SBicerik.ToString().Substring(tagPositionStart, tagPositionEnd - tagPositionStart);
            StringBuilder SBGaleriHtmlKodlari = new StringBuilder();

            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(tag);
            XmlNode node = xDoc.SelectSingleNode("/img");
            string StyleWH = "";
            if (node.Attributes["width"] != null)
                StyleWH += " style=\"width:" + node.Attributes["width"].Value + "px;";
            else
                StyleWH += " style=\"width:100%;";
            if (node.Attributes["height"] != null)
                StyleWH += "height:" + node.Attributes["height"].Value + "px;\"";
            else
                StyleWH += "\"";

            Snlg_DBParameter[] DBPrms = new Snlg_DBParameter[2];
            DBPrms[0] = new Snlg_DBParameter("@GId", SqlDbType.Int, node.Attributes["gallery_id"].Value);
            DBPrms[1] = new Snlg_DBParameter("@Dil", SqlDbType.SmallInt, Snlg_ConfigValues.s_ZDilId);

            #region ZoomGallery resim galerisi için kodlar
            if (node.Attributes["gallery_type"].Value == "zoom_gallery")
            {
                //bu galeri için gerekli scriptler ve css ler import edilyoir
                pg.ScriptOrCssFileImportHead("/scripts/JQuery_Zoom_Wizard/js/5c8a156.js");
                pg.ScriptOrCssFileImportHead("/scripts/JQuery_Zoom_Wizard/css/c3732c4.css");
                pg.SBJsKodlari.Append("$(document).ready(function () {$('.jquery_zoom1_thumbs img').click(function (event) { $('.jquery_zoom1 img.zoomwizard').attr('src', $(this).attr('src').replace('k_glr_', 'glr_')); });});");

                //galeirnin oluşması için gerekkli html kodları oluşturuluyor.
                SBGaleriHtmlKodlari.Append("<div " + StyleWH + " class=\"row\">");

                //resimler çekilyor
                DataTable DTResimler = vt.DataTableOlustur("snlg_V1.zsp_GaleridekiResimler", CommandType.StoredProcedure, DBPrms);


                SBGaleriHtmlKodlari.Append("<div class=\"jquery_zoom1_thumbs col-md-3\">");

                //thumb'lar listeleniyor
                foreach (DataRow dr in DTResimler.Rows)
                    SBGaleriHtmlKodlari.AppendFormat("<img src=\"{0}\" class=\"img-responsive\"/>", dr["Resim"].ToString());

                SBGaleriHtmlKodlari.Append("</div>");


                SBGaleriHtmlKodlari.Append("<div class=\"jquery_zoom1 col-md-9\"><div class=\"img-wrap img-responsive\">");



                //default resim ayarlanıyor
                if (DTResimler.Rows.Count > 0)
                    SBGaleriHtmlKodlari.AppendFormat("<img src=\"{0}\" class=\"zoomwizard\" />", DTResimler.Rows[0]["Resim"].ToString());


                SBGaleriHtmlKodlari.Append("</div></div></div>");

            }





            #endregion

            #region LightBox tarzı resim galerisi için kodlar
            if (node.Attributes["gallery_type"].Value == "lightbox")
            {
                //bu galeri için gerekli scriptler ve css ler import edilyor
                pg.ScriptOrCssFileImportHead("/scripts/bootstrap-lightbox/js/bootstrap-lightbox.js");
                pg.ScriptOrCssFileImportHead("/scripts/bootstrap-lightbox/css/bootstrap-lightbox.css");

                //galeirnin oluşması için gerekli html kodları oluşturuluyor.
                SBGaleriHtmlKodlari.Append("<div " + StyleWH + ">");
                SBGaleriHtmlKodlari.Append("<div class=\"LBGallery\"><div class=\"row\">");

                using (SqlDataReader sdr = vt.DBReaderOlustur("snlg_V1.zsp_GaleridekiResimler", CommandType.StoredProcedure, DBPrms))
                {//galerideki resimler alınıyor
                    while (sdr.Read())
                        SBGaleriHtmlKodlari.AppendFormat("<div class=\"gallery-img-wrapper col-sm-4 mb-lg\"><div class=\"gallery-img-title\">{2}</div><div class=\"gallery-img-image\"><a rel=\"{0}\" href=\"{1}\" data-title=\"{2}\"  data-footer=\"{3}\"  data-toggle=\"lightbox\" data-gallery=\"multiimages\"><img src=\"{1}\" title=\"{2}\" alt=\"{3}\" class=\"img-responsive\"/></a></div></div>", node.Attributes["gallery_id"].Value, sdr["Resim"].ToString(), sdr["Baslik"].ToString().Replace("\"", ""), sdr["Bilgi"].ToString().Replace("\"", ""));
                }
                SBGaleriHtmlKodlari.Append("</div></div></div>");
            }
            #endregion

            #region bootstrap carousel
            if (node.Attributes["gallery_type"].Value == "bootstrap-carousel")
            {
                DataTable DT = vt.DataTableOlustur("snlg_V1.zsp_GaleridekiResimler", CommandType.StoredProcedure, DBPrms);

                //galeirnin oluşması için gerekkli html kodları oluşturuluyor.
                SBGaleriHtmlKodlari.AppendFormat(@"
                    <div id='myCarousel-{0}' class='carousel slide' data-ride='carousel'>
                        <ol class='carousel-indicators'>", node.Attributes["gallery_id"].Value);

                for (int i = 0; i < DT.Rows.Count; i++)
                    SBGaleriHtmlKodlari.AppendFormat(@"<li data-target='#myCarousel-{0}' data-slide-to='{1}' {2}></li>", node.Attributes["gallery_id"].Value, i.ToString(), (i == 0 ? "class='active'" : ""));


                SBGaleriHtmlKodlari.Append(@"
                    </ol>
                    <div class='carousel-inner' role='listbox'>");


                for (int i = 0; i < DT.Rows.Count; i++)
                {
                    SBGaleriHtmlKodlari.AppendFormat(@"
                        <div class='item {0}'>
                            <a {4}><img src='{1}' alt='{2}' ></a>
                            <div class='carousel-caption'>
                                <h3>{2}</h3>
                                <p>{3}</p>
                            </div>
                        </div>",
                            (i == 0 ? "active" : ""), DT.Rows[i]["Resim"].ToString(), HttpContext.Current.Server.HtmlEncode(DT.Rows[i]["Baslik"].ToString()), HttpContext.Current.Server.HtmlEncode(DT.Rows[i]["Bilgi"].ToString()), (string.IsNullOrEmpty(DT.Rows[i]["LinkUrl"].ToString()) ? "" : "href='" + DT.Rows[i]["LinkUrl"].ToString() + "'"));
                }


                SBGaleriHtmlKodlari.AppendFormat(@"
                    </div>
                    <a class='left carousel-control' href='#myCarousel-{0}' role='button' data-slide='prev'>
                        <span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>
                        <span class='sr-only'>Previous</span>
                    </a>
                    <a class='right carousel-control' href='#myCarousel-{0}' role='button' data-slide='next'>
                        <span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>
                        <span class='sr-only'>Next</span>
                    </a>
                </div>
                ", node.Attributes["gallery_id"].Value);



            }
            #endregion

            SBicerik.Replace(tag, SBGaleriHtmlKodlari.ToString());
        }
    }
}