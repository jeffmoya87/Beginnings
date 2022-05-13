using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models.Coding_Challenge;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Services.Coding_Challenge
{
    public class CourseServices : ICourseServices
    {
        IDataProvider _data = null;

        public CourseServices(IDataProvider data)
        {
            _data = data;
        }

        public int Create(CourseAddRequest model, int userId)
        {
            int id = 0;

            string procName = "[dbo].[Course_Insert]";

            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                idOut.Direction = ParameterDirection.Output;
                AddCommonParams(model, col);
                col.Add(idOut);
            }, returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object cId = returnCollection["@Id"].Value;

                int.TryParse(cId.ToString(), out id);
            });
            return id;
        }

        public Course Get(int id)
        {
            string procName = "[dbo].[Course_SelectById]";
            Course course = null;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            }, delegate (IDataReader reader, short set)
            {
                course = MapCourse(reader);

            });
            return course;
        }

        public void Update(CourseUpdateRequest model)
        {
            string procName = "[dbo].[Course_Update]";
            _data.ExecuteNonQuery(procName, inputParamMapper: 
                delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@Id", model.Id);
                AddCommonParams(model, col);
            },
            returnParameters: null);
        }

        public void Delete(int id)
        {
            string procName = "[dbo].[Student_Delete]";

            _data.ExecuteNonQuery(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            });
        }

        private static Course MapCourse(IDataReader reader)
        {
            Course course = new Course();

            int startingIndex = 0;

            course.Id = reader.GetSafeInt32(startingIndex++);
            course.Name = reader.GetSafeString(startingIndex++);
            course.Description = reader.GetSafeString(startingIndex++);
            course.SeasonTerm = reader.GetSafeString(startingIndex++);
            course.Teacher = reader.GetSafeString(startingIndex++);
            course.Students = reader.DeserializeObject<List<Student>>(startingIndex++);

            return course;
        }

        private static void AddCommonParams(CourseAddRequest model, SqlParameterCollection col)
        {
            col.AddWithValue("@Name", model.Name);
            col.AddWithValue("@Description", model.Description);
            col.AddWithValue("@SeasonTermId", model.SeasonTermId);
            col.AddWithValue("@TeacherId", model.TeacherId);
        }
    }
}
