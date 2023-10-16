package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {


    @Autowired
    private LectureService lectureService;

    @Autowired
    HttpSession session;
    @Autowired
    private MemberService memberService;


    @GetMapping("lectureList.do")		// board/list.do
    public String getLectureList(HttpServletRequest request, Model model) throws Exception {

        String teacher = request.getParameter("teacher");
        String subject = request.getParameter("category");
            List<Lecture> lectureList = lectureService.getSubjectLectureList(subject);
            model.addAttribute("lectureList", lectureList);
            model.addAttribute("subject",subject);
        if(subject.equals("kor")) {
            model.addAttribute("subjectKor","국어");
        } else if (subject.equals("eng")) {
            model.addAttribute("subjectKor","영어");
        } else if (subject.equals("his")) {
            model.addAttribute("subjectKor","한국사");
        } else if(subject.equals("math")) {
            model.addAttribute("subjectKor","수학");
        } else if(subject.equals("soc")) {
            model.addAttribute("subjectKor","사회탐구");
        } else if(subject.equals("sci")) {
            model.addAttribute("subjectKor","과학탐구");
        }

        return "/lecture/lectureList";
    }

    //강의 상세
    @GetMapping("lectureDetail.do")
    public String getLectureDetail(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no")); //강의 번호
        Lecture lecture = lectureService.getLecture(no);
        model.addAttribute("lecture",lecture);

        return "/lecture/lectureDetail";
    }

    //수강신청
    @GetMapping("lectureEnroll.do")
    public String lectureEnroll(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no")); //강의 번호
        Lecture lecture = lectureService.getLecture(no);
        model.addAttribute("lecture",lecture);

        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        System.out.println(member.toString());
        //강의 정보 불러옴
        //결제



        return "/lecture/lectureEnroll";
    }

    //수강 신청 완료 처리
    @PostMapping("lectureEnroll.do")
    public String lectureEnrollPro(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("lectureno")); //강의 번호
        String id = (String) session.getAttribute("sid");

        //수강 인원 +1
        //수강 테이블에 등록
        //


        return "/lecture/lectureList";
    }


}
