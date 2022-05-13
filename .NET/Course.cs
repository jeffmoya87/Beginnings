﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Coding_Challenge
{
    public class Course
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string SeasonTerm { get; set; }

        public string Teacher { get; set; }

        public List<Student> Students { get; set; }

    }
}
