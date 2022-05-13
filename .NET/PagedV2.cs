using System;
using System.Collections.Generic;

namespace System.Models
{
    public class PagedV2<T>
    {
        public int PageIndex { get; }

        public int PageSize { get; }

        public string Query { get; }

        public int TotalCount { get; }

        public int TotalPages { get; }

        public List<T> PagedItems { get; }

        /// <summary>
        /// This constructor to be used when using database paging
        /// </summary>
        /// <param name="data"></param>
        /// <param name="page"></param>
        /// <param name="pagesize"></param>
        /// <param name="query"></param>
        /// <param name="totalCount"></param>
        public PagedV2(List<T> data, int page, int pagesize, string query, int totalCount)
        {
            PageIndex = page;
            PageSize = pagesize;
            Query = query;
            PagedItems = data;

            TotalCount = totalCount;
            TotalPages = (int)Math.Ceiling(TotalCount / (double)PageSize);
        }

        public bool HasPreviousPage => PageIndex > 0;

        public bool HasNextPage => PageIndex + 1 < TotalPages;
    }
}
