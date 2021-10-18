package Pack;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FunController {

//    @RequestMapping("/error")
//    public String err() {
//        return "index";
//    }

    @RequestMapping(value = "/")
    public String home() {
        System.out.println("컨트롤러 콜");
        return "index";
    }

    @RequestMapping(value = "/login")
    public String login() {
        System.out.println("l컨트롤러 콜");
        return "login";
    }

    @RequestMapping(value = "/indexAdmin")
    public String indexAdmin(HttpSession session, Model model, HttpServletResponse response, adminBean adminBean, HttpServletRequest req) {
        System.out.println("indexAdmin 컨트롤러 콜");
        FunDAO funDAO = new FunDAO();
        List<reserveBean> reserve = null;
        String id = req.getParameter("id");
        System.out.println(id);
        memberBean mb = new memberBean();
        mb.setMem_id(id);
        if (id != null) {
            if (funDAO.select_mem("id_check", mb) > 0) {
                reserve = funDAO.select("myReserve", id);
                model.addAttribute("res", reserve);
                model.addAttribute("mem", funDAO.searching("mem_myrent", id));
                model.addAttribute("id", id);
                return "indexAdmin";
            } else {
                response.setContentType("text/html; charset=utf-8");
                try {
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('존재하지 않는 회원입니다.');</script>");
                    out.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return "indexAdmin";
        }
        return "indexAdmin";
    }

    //**************************************************************송용민

    @RequestMapping(value = "/mem_myrent")
    public String mem_myrent(HttpSession session, Model model, FunDAO funDAO, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");
        if (session.getAttribute("member") != null) {
            System.out.println("mem_myrent 콜");
            System.out.println(session.getAttribute("member"));
            String id = (String) session.getAttribute("member");

            if (id != null) {
                model.addAttribute("mem", funDAO.searching("mem_myrent", id));
                return "mem_myrent";
            } else {
                try {
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('로그인 해주세요.'); location.href='/' </script>");
                    out.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    return "index";
                }
            }
        } else {
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 해주세요.'); location.href='/'; </script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "index";
        }
    }

    @RequestMapping(value = "/mem_searching")
    public String mem_search(Model model, FunDAO funDAO, memberBean bean, HttpSession session, HttpServletResponse response) {

        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }

        System.out.println("mem_searching 컨트롤러 콜");
        System.out.println(bean.getMem_id());
        if (bean.getMem_id() == null) {
            model.addAttribute("mem", funDAO.select("mem_select"));
            return "mem_search";
        } else {
            model.addAttribute("mem", funDAO.searching("mem_searching", bean.getMem_id()));
            return "mem_search";
        }
    }

    @RequestMapping(value = "/mem_fix")
    public String mem_fix(Model model, FunDAO funDAO, memberBean bean) {
        System.out.println("mem_fix 컨트롤러 콜");

        model.addAttribute("mem", funDAO.searching("mem_searching", bean.getMem_id()));
        return "mem_fix";
    }

    @RequestMapping(value = "/mem_updating")
    public String mem_updating(Model model, FunDAO funDAO, memberBean bean, HttpServletResponse response, HttpSession session) {

        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }

        System.out.println("mem_updating 컨트롤러 콜");
        System.out.println(bean.getMem_id() + " mem_updating");
        funDAO.update("mem_updating", bean);
        if (bean.getMem_id() == null) {
            model.addAttribute("mem", funDAO.select("mem_select"));
            return "mem_search";
        } else {
            model.addAttribute("mem", funDAO.searching("mem_searching", bean.getMem_id()));
            return "redirect:/mem_fix?mem_id=" + bean.getMem_id();
        }
    }

    //***************************************************채송화

    @RequestMapping("/mem_update")
    public String mem_update(Model model, memberBean memberBean) {
        FunDAO funDAO = new FunDAO();
        funDAO.update("mem_update", memberBean);
        List<memberBean> m = funDAO.mem_search("mem_search", memberBean);
        model.addAttribute("m", m);
        return ("memUpdatePage.jsp?uId=" + memberBean.getMem_id());
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate(); //세션의 모든정보 삭제
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }

    @RequestMapping(value = "/Join")
    public String Join() {
        System.out.println("join 콜");
        return "Join";
    }

    @RequestMapping(value = "/memUpdatePage")
    public String memUpdatePage(HttpSession session, Model model, memberBean memberBean, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");
        System.out.println("memUpdatePage 콜");
        if (session.getAttribute("member") == null) {
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 해주세요.'); location.href='/login';</script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "index";
        } else {
            FunDAO funDAO = new FunDAO();
            memberBean.setMem_id((String) session.getAttribute("member"));
            List<memberBean> m = funDAO.mem_search("mem_search", memberBean);
            model.addAttribute("m", m);
            return "memUpdatePage";
        }
    }

    @RequestMapping(value = "/index_adm")
    public String index_adm() {
        System.out.println("index_adm 콜");
        return "index_adm";
    }

    @RequestMapping(value = "/findid")
    public String findid() {
        System.out.println("findid 콜");
        return "findid";
    }

    @RequestMapping(value = "/findpass")
    public String findpass() {
        System.out.println("findpass 콜");
        return "findpass";
    }

    @RequestMapping(value = "/idCheckForm")
    public String idCheckForm() {
        System.out.println("idCheckForm 콜");
        return "idCheckForm";
    }

    @RequestMapping(value = "/idCheckProc")
    public String idCheckProc() {
        System.out.println("idCheckProc 콜");
        return "idCheckProc";
    }

    @RequestMapping(value = "/mem_delcheck")
    public String mem_delcheck() {
        System.out.println("mem_delcheck 콜");
        return "mem_delcheck";
    }

    @RequestMapping("/find_id")
    public String find_id(Model model, memberBean memberBean, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            FunDAO funDAO = new FunDAO();
            String mem_id = funDAO.find("find_id", memberBean);
            model.addAttribute("mem_id", mem_id);
            if (mem_id != null)
                return "find_id_succes";
            else {
                out.println("<script>alert('존재하지 않는 회원입니다.');history.go(-1);</script>");
                out.flush();
                out.close();
                return "redirect:/findid";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/findid";
    }

    @RequestMapping("/find_pass")
    public String find_pass(Model model, memberBean memberBean, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            FunDAO funDAO = new FunDAO();
            String mem_pass = funDAO.find("find_pass", memberBean);
            model.addAttribute("mem_pass", mem_pass);
            if (mem_pass != null)
                return "find_pass_succes";
            else {
                out.println("<script>alert('ID나 이름을 다시 확인해주세요.');history.go(-1);</script>");
                out.flush();
                out.close();
                return "redirect:/findpass";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/findpass";
    }

    @RequestMapping("/login_mem")
    public String login_mem(Model model, memberBean memberBean, HttpServletResponse response, HttpSession session) {
        response.setContentType("text/html; charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            FunDAO funDAO = new FunDAO();
            int count = funDAO.select_mem("login_mem", memberBean);
            System.out.println(count);
            if (count > 0) {
                session.setAttribute("member", memberBean.getMem_id());
                session.setAttribute("adm_key", 0);
                out.println("<script>alert('" + memberBean.getMem_id() + "님 로그인을 환영합니다.');</script>");
                out.flush();
                return "index";
            } else {
                System.out.println("로그인 실패");
                out.println("<script>alert('로그인에 실패하였습니다.');history.go(-1);</script>");
                out.flush();
                out.close();
                return "redirect:/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/login";

    }

    @RequestMapping("/login_adm")
    public String login_mem(Model model, adminBean adminBean, HttpServletResponse response, HttpSession session) {
        response.setContentType("text/html; charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            FunDAO funDAO = new FunDAO();
            int count = funDAO.select_adm("login_adm", adminBean);
            if (count > 0) {
                session.setAttribute("admin", adminBean.getAd_id());
                session.setAttribute("adm_key", 1);
                return "indexAdmin";
            } else {
                out.println("<script>alert('로그인에 실패하였습니다.');history.go(-1);</script>");
                out.flush();
                out.close();
                return "redirect:/index_adm";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index_adm";
    }

    @RequestMapping("/id_check")
    public String id_check(Model model, memberBean memberBean) {
        FunDAO funDAO = new FunDAO();
        int count = funDAO.select_mem("id_check", memberBean);
        model.addAttribute("count", count);
        System.out.println("id_check");
        System.out.println(memberBean.getMem_id());
        return "/idCheckProc";
    }

    @RequestMapping("/join_success")
    public String join_success(Model model, memberBean memberBean) {
        System.out.println(memberBean.getMem_id());
        FunDAO funDAO = new FunDAO();
        funDAO.insert("insert_mem", memberBean);
        return "join_succ";
    }

    @RequestMapping("/mem_delete")
    public void mem_delete(Model model, memberBean memberBean, HttpServletResponse response, HttpSession session, HttpServletRequest request) {
        response.setContentType("text/html; charset=utf-8");
        FunDAO funDAO = new FunDAO();
        int count = funDAO.selectUser("rent_count", (String) session.getAttribute("member"));
        if (count == 0) { //빌린 책이 없을 경우
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('탈퇴되었습니다.');location.href='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.print((String) session.getAttribute("member"));
            funDAO.delete("mem_reserve_delete", (String) session.getAttribute("member"));
            funDAO.delete("mem_delete", (String) session.getAttribute("member"));
            session.invalidate(); //세션의 모든정보 삭제
        } else { //빌린 책이 있을 경우
            try {
                System.out.println("빌린 책 존재");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('대여하신 책을 반납해주신 후 탈퇴 시도해주세요.');location.href='/memUpdatePage';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    ///*****************************************************
    @RequestMapping(value = "/bookMgt")
    public String bookMgt(HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        System.out.println("book management controller call");
        return "bookMgt";
    }

    @RequestMapping(value = "/bookAdd")
    public String bookAdd(HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/'; </script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        System.out.println("book add controller call");
        return "bookAdd";
    }

    @RequestMapping(value = "/bookInsert")
    public void bookInsert(Model model, bookBean BookBean,
                           MultipartHttpServletRequest mtfRequest, HttpServletResponse res) {
        FunDAO funDAO = new FunDAO();
        funDAO.insert("bookInsert", BookBean);
        // ISBN을 이름으로 사진 추가 (webapp 디렉토리 밑에 images 디렉토리 생성해야 에러 안 뜸)
        MultipartFile mf = mtfRequest.getFile("file");
        if (!mf.isEmpty()) {
            String os = System.getProperty("os.name").toLowerCase();
            String path = "";
            if (os.contains("win")) {
                path = "\\src\\main\\webapp\\images\\bookcover\\";
            } else {
                path = "/src/main/webapp/images/bookcover/";
            }
            String filename = mf.getOriginalFilename();
            String fileform = filename.substring(filename.lastIndexOf(".") + 1);

            String safeFile = System.getProperty("user.dir") + path + BookBean.getB_ISBN() + "." + fileform.toUpperCase();
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("book insert controller call");

        // 등록된 도서정보 출력
        try {
            res.sendRedirect("/M_searchResult?type=ISBN&inputValue=" + BookBean.getB_ISBN());
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("book update info controller call");
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "search";
    }

    //관리자 페이지
    //전체 대여 현황 조회 페이지 이동
    @RequestMapping(value = "/bookStatus")
    public String bookStatus(Model model, rentBean rentBean, FunDAO funDAO, HttpServletResponse response, HttpSession session) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/'; </script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        List<bookBean> res = null;
        res = funDAO.select("bookStatus", rentBean);
        model.addAttribute("res", res);
        model.addAttribute("total", funDAO.select("bookTotal"));
        return "bookStatus";
    }

    @RequestMapping(value = "/searchResult")
    public String searchResult(Model model, HttpServletRequest req, HttpSession session, SearchBean searchBean) {
        String type = req.getParameter("type");
        String inputValue = req.getParameter("inputValue");
        String start = req.getParameter("start");
        if (start == null) start = "0";
        searchBean.setInput(inputValue);
        searchBean.setStart(start);
        FunDAO funDAO = new FunDAO();
        List<bookBean> res = null;
        switch (type) {
            case "combine" -> res = funDAO.select("combineSearch", searchBean);
            case "author" -> res = funDAO.select("authorSearch", searchBean);
            case "name" -> res = funDAO.select("nameSearch", searchBean);
            case "publisher" -> res = funDAO.select("publisherSearch", searchBean);
            case "ISBN" -> res = funDAO.select("ISBNSearch", searchBean);
            case "id" -> res = funDAO.select("IdSearch", searchBean);
            default -> {
                break;
            }
        }
        System.out.println(res != null ? res.size() : 0);
        model.addAttribute("res", res);
        return "searchResult";
    }

    @RequestMapping(value = "/reserveSuccess")
    public String reserveSuccess(Model model, bookBean bB) {
        System.out.println(bB.getLoginId());
        System.out.println(bB.getB_id());
        System.out.println(bB.getReserve_date());
        FunDAO funDAO = new FunDAO();
        funDAO.insert("reserveInsert", bB);
        return "index";
    }

    @RequestMapping(value = "/bookUpdateInfo")
    public void bookUpdateInfo(Model model, bookBean BookBean,
                               MultipartHttpServletRequest mtfRequest, HttpServletResponse res, HttpSession session, HttpServletResponse response) {

        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                response.sendRedirect("index");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        FunDAO funDAO = new FunDAO();
        funDAO.update("bookUpdateInfo", BookBean);

        // ISBN을 이름으로 사진 추가 (webapp 디렉토리 밑에 images 디렉토리 생성해야 에러 안 뜸)
        MultipartFile mf = mtfRequest.getFile("file");
        String b_id = BookBean.getB_id();
        // 사진 파일이 있을 때만 수행
        if (!mf.isEmpty()) {
            String os = System.getProperty("os.name").toLowerCase();
            String path = "";
            if (os.contains("win")) {
                path = "\\src\\main\\webapp\\images\\bookcover\\";
            } else {
                path = "/src/main/webapp/images/bookcover/";
            }

            String filename = mf.getOriginalFilename();
            String fileform = filename.substring(filename.lastIndexOf(".") + 1);

            String safeFile = System.getProperty("user.dir") + path + BookBean.getB_ISBN() + "." + fileform.toUpperCase();
            System.out.println(safeFile);
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 변경된 도서정보 출력
        try {
            res.sendRedirect("/M_searchResult?type=id&inputValue=" + b_id);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("book update info controller call");
    }

    // 수정 버튼 눌렀을 때 input 에 기존 value 불러 오기 위한 기능
    @RequestMapping(value = "/bookUpdate")
    public String bookUpdate(Model model, HttpServletRequest req, SearchBean searchBean, HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/'; </script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        String type = req.getParameter("type");
        String inputValue = req.getParameter("inputValue");
        String start = req.getParameter("start");
        if (start == null) start = "0";
        searchBean.setInput(inputValue);
        searchBean.setStart(start);
        FunDAO funDAO = new FunDAO();
        List<bookBean> res = null;
        res = funDAO.select("IdSearch", searchBean);

        model.addAttribute("res", res);
        return "bookUpdate";
    }

    @RequestMapping(value = "/M_searchResult")
    public String searchResult(Model model, HttpServletRequest req, SearchBean searchBean, HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/'; </script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        String type = req.getParameter("type");
        String inputValue = req.getParameter("inputValue");
        String start = req.getParameter("start");
        if (start == null) start = "0";
        searchBean.setInput(inputValue);
        searchBean.setStart(start);
        FunDAO funDAO = new FunDAO();
        List<bookBean> res = null;
        switch (type) {
            case "combine" -> res = funDAO.select("combineSearch", searchBean);
            case "author" -> res = funDAO.select("authorSearch", searchBean);
            case "name" -> res = funDAO.select("nameSearch", searchBean);
            case "publisher" -> res = funDAO.select("publisherSearch", searchBean);
            case "ISBN" -> res = funDAO.select("ISBNSearch", searchBean);
            case "id" -> res = funDAO.select("IdSearch", searchBean);
            default -> {
                break;
            }
        }

        model.addAttribute("res", res);
        return "M_searchResult";
    }

    @RequestMapping(value = "/bookDelete")
    public String bookDelete(Model model, HttpServletRequest req, bookBean bookBean, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");

        FunDAO funDAO = new FunDAO();
        String b_id = req.getParameter("b_id");
        int count1 = funDAO.selectUser("rent_count1", b_id);
        int count2 = funDAO.selectUser("rent_count2", b_id);
        if (count1 == 0 && count2 == 0) { //빌린 책이 없을 경우
            bookBean.setB_id(b_id);
            bookBean.setB_name("");
            bookBean.setB_author("");
            bookBean.setB_publisher("");
            bookBean.setB_genre("");
            bookBean.setB_ISBN("0");
            funDAO.update("bookUpdateInfo", bookBean);
            try {
                PrintWriter out = response.getWriter();
                out = response.getWriter();
                out.println("<script>alert('도서가 삭제 되었습니다.'); </script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "bookMgt";
        } else { //빌린 책이 있을 경우
            try {
                PrintWriter out = response.getWriter();
                System.out.println("빌린 책 존재");
                out.println("<script>alert('대출 중 이거나 예약 중 입니다.');</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "bookMgt";
    }

    //*******************************************************김민건

    @RequestMapping(value = "/returnPage")
    public String returnPage(HttpServletRequest request, Model model, bookBean bB, HttpSession session, HttpServletResponse response) {
        if (session.getAttribute("admin") == null) {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        System.out.println("returnPage 컨트롤러 콜");
        String btnOnOff = "OFF"; //승인 버튼 ONOFF 판별해줄용도
        if (bB.getB_id() != null) {
            FunDAO fundao = new FunDAO();
            System.out.println(bB.getB_id() + " 검색");
            List<bookBean> mm = fundao.select("IDSearch", bB);
            String reserve_date = "예약중";
            String return_date = "대여중";
            if (!mm.isEmpty()) {
                if (mm.get(0).getReserve_date() == null) {
                    reserve_date = "예약없음";
                }
                if (mm.get(0).getReturn_date() == null) {
                    return_date = "대여가능";
                } else {
                    btnOnOff = "ON"; //대여중이면 버튼 ON
                }
            }
            model.addAttribute("bB", mm);
            model.addAttribute("reserve_date", reserve_date);
            model.addAttribute("return_date", return_date);
        }
        model.addAttribute("btnOnOff", btnOnOff);
        return "returnPage";
    }

    @RequestMapping(value = "/subReturnPage")
    public String subReturnPage(HttpServletRequest request, Model model, bookBean bB, rentBean rB, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html; charset=utf-8");
        if (session.getAttribute("admin") == null) {
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('관리자만 이용가능합니다.'); location.href ='/';</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "index";
        }
        System.out.println("returnPage 컨트롤러 콜");
        FunDAO fundao = new FunDAO();
        String btnOnOff = "OFF"; //승인 버튼 ONOFF 판별해줄용도
        String returnSuccess = "success";
        fundao.update("returnUpdate", rB);
        if (rB.getBook_b_id() != null) {
            bB.setB_id(rB.getBook_b_id());
            List<bookBean> mm = fundao.select("IDSearch", bB);
            String reserve_date = "예약중";
            String return_date = "대여중";
            if (!mm.isEmpty()) {
                if (mm.get(0).getReserve_date() == null) {
                    reserve_date = "예약없음";
                }
                if (mm.get(0).getReturn_date() == null) {
                    return_date = "대여가능";
                } else {
                    btnOnOff = "ON"; //대여중이면 버튼 ON
                }
            }
            model.addAttribute("returnSuccess", returnSuccess);
            model.addAttribute("bB", mm);
            model.addAttribute("reserve_date", reserve_date);
            model.addAttribute("return_date", return_date);
        }
        model.addAttribute("btnOnOff", btnOnOff);
        return "returnPage";
    }

    @RequestMapping(value = "/rentPage")
    public String rentPage(HttpServletRequest request, Model model, bookBean bB) {
        System.out.println("rentPage 컨트롤러 콜");
        String mem_id = request.getParameter("mem_id");
        String btnOnOff = "OFF"; //승인 버튼 ONOFF 판별해줄용도
        if (bB.getB_id() != null) {
            FunDAO fundao = new FunDAO();
            System.out.println(bB.getB_id() + " 검색");
            List<bookBean> mm = fundao.select("IDSearch", bB);
            String reserve_date = "예약중";
            String return_date = "대여중";
            if (!mm.isEmpty()) {
                if (mm.get(0).getReserve_date() == null) {
                    reserve_date = "예약없음";
                }
                if (mm.get(0).getReturn_date() == null) {
                    return_date = "대여가능";

                    if (mm.get(0).getReserve_date() == null) { //대여가능에 예약자가 없으면 ON
                        btnOnOff = "ON";
                    } else {
                        for (bookBean b : mm) { //예약자아이디=회원아이디이면 버튼ON 수정필요!!! 첫번째 예약자만 체크
                            if (mem_id.equals(b.getMember_mem_id())) {
                                btnOnOff = "ON";
                                break;
                            }
                        }
                    }
                }
            }
            model.addAttribute("bB", mm);
            model.addAttribute("reserve_date", reserve_date);
            model.addAttribute("return_date", return_date);
        }
        System.out.println(mem_id + " 대여 페이지 이동");
        model.addAttribute("btnOnOff", btnOnOff);
        model.addAttribute("mem_id", mem_id);
        return "rentPage";
    }

    @RequestMapping(value = "/subRentPage")
    public String rentPage(HttpServletRequest request, Model model, rentBean rB) {
        System.out.println("rentPage 컨트롤러 콜 sub");
        FunDAO fundao = new FunDAO();
        String mem_id = rB.getMember_mem_id();
        String btnOnOff = "OFF"; //승인 버튼 ONOFF 판별해줄용도
        String rentSuccess = "success";
        fundao.insert("rentInsert", rB); //rent insert하기
        fundao.delete("rentReserveDelete", rB);
        if (rB.getBook_b_id() != null) {
            bookBean bB = new bookBean();
            System.out.println(rB.getBook_b_id() + " 검색");
            bB.setB_id(rB.getBook_b_id());
            List<bookBean> mm = fundao.select("IDSearch", bB);
            String reserve_date = "예약중";
            String return_date = "대여중";
            if (!mm.isEmpty()) {
                if (mm.get(0).getReserve_date() == null) {
                    reserve_date = "예약없음";
                }
                if (mm.get(0).getReturn_date() == null) {
                    return_date = "대여가능";

                    if (mm.get(0).getReserve_date() == null) { //대여가능에 예약자가 없으면 ON
                        btnOnOff = "ON";
                    } else {
                        for (bookBean b : mm) { //예약자아이디=회원아이디이면 버튼ON 수정필요!!! 첫번째 예약자만 체크
                            if (mem_id.equals(b.getMember_mem_id())) {
                                btnOnOff = "ON";
                                break;
                            }
                        }
                    }
                }
            }
            model.addAttribute("rentSuccess", rentSuccess);
            model.addAttribute("bB", mm);
            model.addAttribute("reserve_date", reserve_date);
            model.addAttribute("return_date", return_date);
        }
        System.out.println(mem_id + " 대여 페이지 이동");
        model.addAttribute("btnOnOff", btnOnOff);
        model.addAttribute("mem_id", mem_id);
        return "rentPage";
    }


    //회원가입 안내 페이지로 이동
    @RequestMapping(value = "/memberJoinEx")
    public String memberJoinEx() {
        return "memberJoinEx";
    }

    //반납 기능적 부분임 업데이트하세여
    @RequestMapping(value = "/extendReturnDateSub")
    public String extendReturnDateSub(rentBean rB, Model model, HttpServletResponse response) { //이부분 추가필요 일단 업데이트에 필요한것만 인자로 받는다
        System.out.println("extendReturnDate 컨트롤러 콜");
        FunDAO funDAO = new FunDAO();
        List<reserveBean> reserve = null;
        funDAO.update("extendReturnDate", rB);
        String id = rB.getMember_mem_id();
        if (id != null) {
            reserve = funDAO.select("myReserve", id);
            model.addAttribute("res", reserve);
            model.addAttribute("mem", funDAO.searching("mem_myrent", id));
            model.addAttribute("id", id);
            return "indexAdmin";
        } else {
            response.setContentType("text/html; charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('잘못된 접근입니다.'); location.href ='/'; </script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "indexAdmin";
    }

    @RequestMapping(value = "/myReserve")
    public String myReserve(Model model, HttpServletRequest req, HttpServletResponse response,
                            HttpSession session) {

        response.setContentType("text/html; charset=utf-8");

        String mem_id = (String) session.getAttribute("member");

        FunDAO funDAO = new FunDAO();
        List<reserveBean> reserve = null;

        reserve = funDAO.select("myReserve", mem_id);
        model.addAttribute("res", reserve);
        if (session.getAttribute("member") != null) {
            System.out.println("mem_myrent 콜");
            System.out.println(session.getAttribute("member"));
            String id = (String) session.getAttribute("member");

            if (id != null) {
                model.addAttribute("mem", funDAO.searching("mem_myrent", id));
                return "mem_myrent";
            } else {
                try {
                    response.setContentType("text/html; charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('로그인 해주세요.'); location.href ='/login';</script>");
                    out.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    return "index";
                }
            }
        } else {
            try {
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 해주세요.'); location.href ='/login';</script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "index";
        }
//        return "myReserve";
    }

    @RequestMapping(value = "/reserveDelete")
    public String reserveDelete(Model model, HttpServletRequest req,
                                HttpServletResponse response, HttpSession session) {
        String b_id = req.getParameter("b_id");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println("<script>alert('예약이 취소 되었습니다.'); </script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        reserveBean rb = new reserveBean();
        rb.setB_id(b_id);
        rb.setMem_id((String) session.getAttribute("member"));

        FunDAO funDAO = new FunDAO();
        funDAO.delete("reserveDelete", rb);
        return "index";
    }

    @RequestMapping(value = "/reserveDeleteAdmin")
    public String reserveDeleteAdmin(Model model, HttpServletRequest req, HttpServletResponse response, HttpSession session) {
        FunDAO funDAO = new FunDAO();
        memberBean mb = new memberBean();
        reserveBean rb = new reserveBean();
        List<reserveBean> reserve = null;

        String b_id = req.getParameter("b_id");
        String id = (String) req.getParameter("member");

        mb.setMem_id(id);
        reserve = funDAO.select("myReserve", id);

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println("<script>alert('예약이 취소 되었습니다.'); </script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        rb.setB_id(b_id);
        rb.setMem_id(id);
        funDAO.delete("reserveDelete", rb);
        model.addAttribute("res", reserve);
        model.addAttribute("mem", funDAO.searching("mem_myrent", id));
        model.addAttribute("id", id);
        return "indexAdmin";
    }

}
