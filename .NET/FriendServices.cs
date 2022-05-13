using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests.Addresses;
using Sabio.Models.Requests.Friends;

namespace Sabio.Services
{
    public class FriendServices : IFriendServices
    {
        IDataProvider _data = null;
        
        public FriendServices(IDataProvider data)
        {
            _data = data;
        }
        public Friend Get(int id)
        {
            string procName = "[dbo].[Friends_SelectByIdV0]";
            Friend friend = null;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            }, delegate (IDataReader reader, short set)
            {
                friend = MapFriend(reader);
            }
            );
            return friend;
        }

        public Paged<Friend> Pagination(int pageIndex, int pageSize)
        {
            string procName = "[dbo].[Friends_PaginationV0]";
            Paged<Friend> pagedList = null;
            List<Friend> list = null;
            int totalCount = 0;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Index", pageIndex);
                paramCollection.AddWithValue("@PageSize", pageSize);
            }, delegate (IDataReader reader, short set)
            {
                //int startingIndex = 0;

                Friend friend = MapFriend(reader);
                totalCount = reader.GetSafeInt32(7);

                if (list == null)
                {
                    list = new List<Friend>();
                }

                list.Add(friend);
            });
            if (list != null)
            {
                pagedList = new Paged<Friend>(list, pageIndex, pageSize, totalCount);
            }
            return pagedList;
        }

        public PagedV2<Friend> SearchPaginate(int pageIndex, int pageSize, string query)
        {
            string procName = "[dbo].[Friends_Search_Pagination]";
            PagedV2<Friend> pagedList = null;
            List<Friend> list = null;
            int totalCount = 0;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Index", pageIndex);
                paramCollection.AddWithValue("@PageSize", pageSize);
                paramCollection.AddWithValue("@Query", query);
            }, delegate (IDataReader reader, short set)
            {
                Friend friend = MapFriend(reader);
                totalCount = reader.GetSafeInt32(7);

                if (list == null)
                {
                    list = new List<Friend>();
                }
                list.Add(friend);
            });
            if(list != null)
            {
                pagedList = new PagedV2<Friend>(list, pageIndex, pageSize, query, totalCount);
            }
            return pagedList;
        }

        public void Delete(int id)
        {
            string procName = "[dbo].[Friends_Delete]";


            _data.ExecuteNonQuery(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            });
        }

        public List<Friend> GetAll()
        {
            List<Friend> list = null;

            string procName = "[dbo].[Friends_SelectAll]";

            _data.ExecuteCmd(procName, inputParamMapper: null,
                singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    Friend friend = MapFriend(reader);
                    if (list == null)
                    {
                        list = new List<Friend>();
                    }
                    list.Add(friend);
                });
            return list;
        }

        public int Add(FriendAddRequest model, int userId)
        {
            int id = 0;

            string procName = "[dbo].[Friends_Insert]";

            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                idOut.Direction = ParameterDirection.Output;


                AddCommonParams(model, col);
                col.Add(idOut);
            }, returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object fId = returnCollection["@Id"].Value;

                int.TryParse(fId.ToString(), out id);
            });
            return id;
        }

        public void Update(FriendUpdateRequest model)
        {
            string procName = "[dbo].[Friends_Update]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    col.AddWithValue("@Id", model.Id);
                    AddCommonParams(model, col);
                },
                returnParameters: null);
        }
        private static void AddCommonParams(FriendAddRequest model, SqlParameterCollection col)
        {
            col.AddWithValue("@Title", model.Title);
            col.AddWithValue("@Bio", model.Bio);
            col.AddWithValue("@Summary", model.Summary);
            col.AddWithValue("@Headline", model.Headline);
            col.AddWithValue("@Slug", model.Slug);
            col.AddWithValue("@StatusId", model.StatusId);
        }
        private static Friend MapFriend(IDataReader reader)
        {
            Friend aFriend = new Friend();

            int startingIndex = 0;

            aFriend.Title = reader.GetSafeString(startingIndex++);
            aFriend.Bio = reader.GetSafeString(startingIndex++);
            aFriend.Summary = reader.GetSafeString(startingIndex++);
            aFriend.Headline = reader.GetSafeString(startingIndex++);
            aFriend.Slug = reader.GetSafeString(startingIndex++);
            aFriend.StatusId = reader.GetSafeBool(startingIndex++);
            aFriend.Id = reader.GetSafeInt32(startingIndex++);

            return aFriend;
        }
    }
}
