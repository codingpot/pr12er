# Metadata manager

## 1. Generate a metadata from the mapping table

MappingTable(database.proto)

```proto
message MappingTable {
  repeated MappingTableRow rows = 1;
}

message MappingTableRow {
  int32 pr_id = 1;
  repeated string paper_arxiv_id = 2;
  string youtube_video_id = 3;
}
```

Database(database.proto)

```
message Database {
  map<int32, PrVideo> pr_id_to_video = 1;
}

// PR영상의 하나의 레코드
message PrVideo {
  int32 pr_id = 1;
  // 관련도에 따라 정렬
  repeated Paper papers = 2;
  YouTubeVideo video = 3;
}

// 유튜브 1편에 대한 정보
// `pkg.pr12er.Video` 생성하기 위해 사용됩니다.
message YouTubeVideo {
  string video_id = 1;
  string video_title = 2;
  int64 number_of_likes = 3;
  int64 number_of_views = 4;
  google.protobuf.Timestamp published_date = 5;
  string uploader = 6;
}
```

2.
