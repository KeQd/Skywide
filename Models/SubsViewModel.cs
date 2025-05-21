namespace Skywide.Views.Shared
{
	public class SubsViewModel
	{
		public int CategoryID { get; set; }
		public bool IsSubscribed { get; set; }

		public SubsViewModel(int categoryID, bool isSubscribed)
		{
			CategoryID = categoryID;
			IsSubscribed = isSubscribed;
		}
	}
}