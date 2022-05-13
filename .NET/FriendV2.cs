using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Domain
{
    public class FriendV2
    {
        public string Title { get; set; }
        public string Bio { get; set; }
        public string Summary { get; set; }
        public string Headline { get; set; }
        public string Slug { get; set; }
        public bool StatusId { get; set; }
        public int Id { get; set; }

        public int PrimaryImageId { get; set; }

        public string Url { get; set; }

        public List<Skill> Skills { get; set; }
    }
}
