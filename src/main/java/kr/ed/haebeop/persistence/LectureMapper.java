package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Lecture;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface LectureMapper {


    //insert delete update

    //리스트
    @Select("select * from lecture")
    public List<Lecture> getLectureList();

    //특정 과목 리스트
    @Select("select * from lecture where category=#{subject}")
    public List<Lecture> getSubjectLectureList(String subject);

    //강의
    @Select("select * from lecture where no= #{no}")
    public Lecture getLecture(int no);



    //수강신청시 인원 +1
    @Update("update lecture set cnt=cnt+1 where no=#{no}  and cnt < max_cnt")
    public void cntUpLecture(int no);




//    @Insert("insert into lecture values (default,'수능대비 국어','ot','sample','kimkor','kor',default,3,50000)")
//    public insertLecture();





}
