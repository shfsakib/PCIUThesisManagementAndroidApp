using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PCIUTMSApp.DAL.Model
{
    public class ResourceModel
    {
        private static ResourceModel _instance;

        public static ResourceModel GetInstance()
        {
            if (_instance == null)
            {
                _instance = new ResourceModel();
            }
            return _instance;
        }
        public string ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string Path { get; set; }
        public string Type { get; set; }
        public string InTime { get; set; }
    }
}