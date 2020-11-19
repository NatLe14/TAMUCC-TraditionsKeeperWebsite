using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TraditionKeeper
{
	public partial class ViewImage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])Session["UploadedImage"]);
		}
	}
}