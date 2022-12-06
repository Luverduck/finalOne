package com.kh.ahzit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.component.RandomGenerator;
import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.CertificationDto;
import com.kh.ahzit.repository.AhzitUserDao;
import com.kh.ahzit.repository.CertificationDao;

@Controller
@RequestMapping("/ahzitUser")
public class AhzitUserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private RandomGenerator randomGenerator; // 랜덤번호 생성

	@Autowired
	private CertificationDao certificationDao; // DB저장

	@Autowired
	private JavaMailSender javaMailSender; // 메일발송
	
	@Autowired
	private AhzitUserDao ahzitUserDao;

	// 회원가입
	@GetMapping("/join")
	public String insert() {
		return "ahzitUser/join";
	}

	@PostMapping("/join")
	public String insert(@ModelAttribute AhzitUserDto ahzitUserDto) {
		ahzitUserDao.join(ahzitUserDto);
		return "redirect:joinSuccess";
	}
	
	// 가입완료
	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "ahzitUser/joinSuccess";
	}

	// 로그인
	@GetMapping("/login")
	public String login() {
		return "ahzitUser/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, @ModelAttribute AhzitUserDto ahzitUserDto,@RequestParam String userId) {
		AhzitUserDto findDto = ahzitUserDao.selectOne(userId);
		// 1. 아이디 패스워드 비교 구문
		// 아이디조회, 비밀번호 조회
		// 2. 암호화
		// 끝
		if (ahzitUserDao.login(ahzitUserDto)) {
			session.setAttribute(SessionConstant.ID, ahzitUserDto.getUserId());
		//로그인 시간 갱신
		ahzitUserDao.updateLoginTime(findDto.getUserId());
			return "redirect:/";
		} else {
			return "redirect:login?error";
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		return "redirect:login";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("ahzitUserDto", ahzitUserDao.selectOne(loginId));
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(loginId);
		model.addAttribute("ahzitUserDto", ahzitUserDto);
		return "ahzitUser/mypage";
	}

	// 회원 정보 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam String userId, HttpSession session) {
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(userId);
		model.addAttribute("ahzitUserDto", ahzitUserDto);
		return "ahzitUser/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute AhzitUserDto ahzitUserDto, RedirectAttributes attr) {
		boolean result = ahzitUserDao.update(ahzitUserDto);
		if (result) {
			attr.addAttribute("userId", ahzitUserDto.getUserId());
			return "redirect:mypage";
		} else {
			return "redirect:edit?error";
		}
	}

	// 마이페이지 비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "ahzitUser/password";
	}

	@PostMapping("/password")
	public String password(HttpSession session, @RequestParam String beforePw, // 사용자가 입력한 기존 비밀번호
			@RequestParam String afterPw) { // 사용자가 입력한 바꿀 비밀번호
		String userId = (String) session.getAttribute(SessionConstant.ID);
		try {
			// 비밀번호 검사
			AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(userId);
			boolean passwordMatch = beforePw.equals(ahzitUserDto.getUserPw());
		
			//System.out.println(beforePw);
			//System.out.println(ahzitUserDto);
			
			if (!passwordMatch) {
				throw new Exception();
			}

			ahzitUserDao.changePw(userId, afterPw); // 변경
			return "redirect:mypage";
		} catch (Exception e) {
			return "redirect:password?error";
		}
	}
	
	// 회원 탈퇴
	@GetMapping("/goodbye")
	public String goodbye() {
		return "ahzitUser/goodbye";
	}
	
	@PostMapping("/goodbye")
	public String goodbye(HttpSession session, @RequestParam String userPw) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(userId);

//		System.out.println(userPw);
//		System.out.println(ahzitUserDto.getUserPw());
//		
		boolean passwordMatch = userPw.equals(ahzitUserDto.getUserPw());
	
		if(passwordMatch) {
			//회원 탈퇴
			ahzitUserDao.delete(userId);
			//로그 아웃
			session.removeAttribute(SessionConstant.ID);
			return "redirect:goodbye_result";
		}
		else {
			return "redirect:goodbye?error";
		}
	}
	
	// 탈퇴 성공 페이지
	@GetMapping("/goodbye_result")
	public String goodbyeResult() {
		return "ahzitUser/goodbyeResult";
	}

	// 아이디 찾기
	@GetMapping("/checkId")
	public String checkId() {
		return"ahzitUser/checkId";
	}
	
	@PostMapping("/checkId")
	public String checkId(
			@RequestParam String userEmail, Model model) {
		
			List<Object> checkId = ahzitUserDao.checkId(userEmail);
		//	model.addAttribute("checkId", checkId);	

			if(checkId.isEmpty()) {
				return "redirect:checkId?error";
			}
			else {
				model.addAttribute("checkId", checkId);	
			}
			// System.out.println("아이디 값 = " + model.getAttribute("checkId"));
			return"ahzitUser/checkId";
	}
	
	// 비밀번호 찾기
		@GetMapping("/checkPw")
		public String checkPw() {
			return"ahzitUser/checkPw";
		}
		
		@PostMapping("/checkPw")
		public String checkPw(
				@RequestParam String userEmail, @RequestParam String userId, Model model) {
			
				Map<String,String>map = new HashMap<String,String>();
				map.put("userId", userId);
				map.put("userEmail", userEmail);
				
				int checkPw = ahzitUserDao.checkPw(map);
				
				//System.out.println("비밀번호 = "+checkPw());
				
				// 이메일 인증
				if(checkPw > 0) {
					// 1) 랜덤 인증 번호 생성 수정 구문
					String serial = randomGenerator.generatSerial(6);
	
					// 2) 이메일 발송
					SimpleMailMessage message = new SimpleMailMessage();
					message.setTo(userEmail);
					message.setSubject("[AHZIT] 비밀번호 확인 인증 번호입니다");
					message.setText("인증번호 : " + serial);
					javaMailSender.send(message);
	
					// 3) 데이터베이스 등록 수정 구문
					certificationDao.delete(userEmail);
					CertificationDto certificationDto = CertificationDto.builder().certificationId(userEmail).certificationKey(serial).build();
					certificationDao.insert(certificationDto);
					model.addAttribute("userId", userId);
					System.out.println("성공");
					}
				else {
					System.out.println("실패");
					String message = "실패하였습니다";
					model.addAttribute("YN", "N");
					model.addAttribute("message", message);
				}
				return"ahzitUser/checkPw";
		}
		
		// 이메일 인증 후 비밀번호 변경
		@GetMapping("/checkPwSuccess")
		public String checkPwSuccess(@RequestParam String userId, Model model) {
			System.out.println("아이디 값 = " + userId);
			model.addAttribute("userId", userId);
			return"ahzitUser/checkPwSuccess";
		}
		
		@PostMapping("/checkPwSuccess")
		public String checkPwSuccess(AhzitUserDto ahzitUserDto, @RequestParam String userId, @RequestParam String userPw) {
			// 1. 안된것 jsp에 있는 userId값을 checkPwSuccess로 전달해야되고 /
			// 2. 전달한 값을 id를 userId라고 했을때 ahzitUserDto.set~~ 해서 담아서 넘겨야됨.
			
			ahzitUserDto.setUserId(userId);
			
			String pw = ahzitUserDto.getUserPw(); // 사용자가 입력한 비밀번호 꺼내오고
			String enc = encoder.encode(pw); // 암호화 시키고
			ahzitUserDto.setUserPw(enc); // 암호화된 비밀번호으로 Dto 에 넣어서
			
			boolean result = ahzitUserDao.checkPwSuccess(ahzitUserDto);
			if (result) {
				return "redirect:checkPwdSuccess";
			} else {
				return "redirect:checkPwSuccess?error";
			}
		}
		
		// 이메일 인증 후 비밀번호 변경 성공 페이지
		@GetMapping("/checkPwdSuccess")
		public String checkPwdSuccess() {
			return "ahzitUser/checkPwdSuccess";
		}
		

}
