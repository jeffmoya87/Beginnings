using Sabio.Models.Coding_Challenge;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Services.Coding_Challenge
{
    public interface ICourseServices
    {
        int Create(CourseAddRequest model, int userId);
        void Delete(int id);
        Course Get(int id);
        void Update(CourseUpdateRequest model);
    }
}
