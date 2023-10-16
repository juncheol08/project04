package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.InstructorService;
import kr.ed.haebeop.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {

//    @Autowired
//    private
    @Autowired
    private LectureService lectureService;

    @Autowired
    private InstructorService instructorService;

    @GetMapping("instructorList.do")		// board/list.do
    public String getInstructorList(HttpServletRequest request,Model model) throws Exception {
//        List<Board> boardList = boardService.boardList();
//        model.addAttribute("boardList", boardList);
        String teacher = request.getParameter("teacher");
//
//        if(teacher.equals("국어")) {
//
//        } else if (teacher.equals("영어")) {
//
//        } else if(teacher.equals("수학")) {
//
//        } else if(teacher.equals("사회탐구")) {
//
//        } else if(teacher.equals("과학탐구")) {
//
//        }

        return "/instructor/instructorList";
    }

    @GetMapping("instructorDetail.do")
    public String getInstructorDetail(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");

        model.addAttribute("teacherName",teacherName);
        return "/instructor/instructorDetail";
    }

    //강의 목록
    @GetMapping("instructorLecture.do")
    public String getInstructorLecture(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        List<Lecture> lectureList = instructorService.getTeacherLectureList(teacherName);

        model.addAttribute("teacherName",teacherName);
        model.addAttribute("lectureList", lectureList);
        return "/instructor/instructorLecture";
    }

    //공지
    @GetMapping("instructorNotice.do")
    public String getInstructorNotice(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        model.addAttribute("teacherName",teacherName);

        List<TeacherNotice> teacherNotices = instructorService.getTeacherNoticeList(teacherName);
        model.addAttribute("teacherNotices",teacherNotices);

        //이름으로 teacher id 가져오기
        Instructor instructor = instructorService.getTeacherId(teacherName);
        model.addAttribute("instructor",instructor);


        return "/instructor/instructorNotice";
    }

    //공지 상세 보기
    @GetMapping("instructorNoticeDetail.do")
    public String getInstructorNoticeDetail(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        model.addAttribute("teacherName",teacherName);
        int no = Integer.parseInt(request.getParameter("no"));
        TeacherNotice teacherNotice = instructorService.getTeacherNoticeDetail(no);
        model.addAttribute("teacherNotice",teacherNotice);

        return "/instructor/instructorNoticeDetail";
    }

    //QNA
    @GetMapping("instructorQNA.do")
    public String getInstructorQNA(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        model.addAttribute("teacherName",teacherName);


        return "/instructor/instructorQNA";
    }

    //자료실
    @GetMapping("instructorFile.do")
    public String getInstructorFile(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        model.addAttribute("teacherName",teacherName);


        return "/instructor/instructorFile";
    }

    //후기
    @GetMapping("instructorReview.do")
    public String getInstructorReview(HttpServletRequest request, Model model) throws Exception {
        String teacherName = request.getParameter("teacherName");
        model.addAttribute("teacherName",teacherName);


        return "/instructor/instructorReview";
    }



}
