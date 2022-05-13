using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Requests.Addresses
{
    public class AddressAddRequest
    {
        public string LineOne { get; set; }

        [Required]
        [Range(1,99999)]
        public int SuiteNumber { get; set; }
        
        [Required]
        [StringLength(100,MinimumLength =2)]
        public string City { get; set; }
        
        public string State { get; set; }
        
        public string PostalCode { get; set; }
       
        public bool IsActive { get; set; }
        
        public float Lat { get; set; }
        
        public float Long { get; set; }
    }
}
