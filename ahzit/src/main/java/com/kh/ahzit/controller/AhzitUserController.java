package com.kh.ahzit.controller;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.component.RandomGenerator;
import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.AhzitUserInterestDto;
import com.kh.ahzit.entity.CertificationDto;
import com.kh.ahzit.repository.AhzitUserDao;
import com.kh.ahzit.repository.AhzitUserInterestDao;
import com.kh.ahzit.repository.CertificationDao;
import com.kh.ahzit.vo.MyAhzitVO;

@Controller
@RequestMapping("/ahzitUser")
public class AhzitUserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder; // 암호화복호화
	
	@Autowired
	private RandomGenerator randomGenerator; // 랜덤번호 생성

	@Autowired
	private CertificationDao certificationDao; // DB저장

	@Autowired
	private JavaMailSender javaMailSender; // 메일발송
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@Autowired
	private AhzitUserInterestDao ahzitUserInterestDao;
	

	// 회원가입
	@GetMapping("/join")
	public String join() {
		return "ahzitUser/join";
	}

	@PostMapping("/join")
	public String join(@ModelAttribute AhzitUserDto ahzitUserDto, @ModelAttribute AhzitUserInterestDto ahzitUserInterestDto, @RequestParam(value="userInterestSort[]") String[] userInterestSort) {
		System.out.println("123123" + ahzitUserDto);
		//회원 정보 회원 테이블 저장
		ahzitUserDao.join(ahzitUserDto);
		System.out.println("78788" +Arrays.toString(userInterestSort));
		System.out.println("dto" + ahzitUserDto);
		
		//입력한 회원아이디 추출
		ahzitUserInterestDto.setUserInterestId(ahzitUserDto.getUserId());
		
	//	System.out.println("@@@@@@@@@@@@@@@@@@@@@" + ahzitUserInterestDto.getUserInterestId());
	
		System.out.println("ahzitUserInterestDto = " + ahzitUserInterestDto);
		
//		// 관심사 저장
		for( int i = 0; i < userInterestSort.length; i++) {	
//		int userInterestNo = ahzitUserInterestDao.sequence();
//		ahzitUserInterestDto.setUserInterestNo(userInterestNo);
		ahzitUserInterestDto.setUserInterestSort(userInterestSort[i]);
		ahzitUserInterestDao.insert(ahzitUserInterestDto);
	}	
//		
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
			session.setAttribute(SessionConstant.GRADE, findDto.getUserGrade());
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
		session.removeAttribute(SessionConstant.GRADE);
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
	public String edit(Model model, @RequestParam String userId) {
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(userId);
		model.addAttribute("ahzitUserDto", ahzitUserDto);
		return "ahzitUser/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute AhzitUserDto ahzitUserDto, HttpSession session, @RequestParam String userInterestId,
			@ModelAttribute AhzitUserInterestDto ahzitUserInterestDto, RedirectAttributes attr, @RequestParam(value="userInterestSort[]") String[] userInterestSort) {
	//	System.out.println(userInterestSort);
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		boolean result = ahzitUserDao.update(ahzitUserDto);
	//	System.out.println("result  = " + result );
		
		ahzitUserInterestDto.setUserInterestId(loginId);
	//	System.out.println(ahzitUserInterestDto);
		
		boolean result1 = ahzitUserInterestDao.delete(loginId);
	
	//	System.out.println("result1 = " + result1);
		
		if (result&&result1) {
		//	System.out.println(ahzitUserDto.getUserId());
			attr.addAttribute("userId", ahzitUserDto.getUserId());
			
			
			for( int i = 0; i < userInterestSort.length; i++) {
//				 ahzitUserDao.update(ahzitUserDto);
				 ahzitUserInterestDto.setUserInterestSort(userInterestSort[i]);
				ahzitUserInterestDao.insert(ahzitUserInterestDto);}
			return "redirect:mypage";
		} else {
			return "redirect:edit?error&userId=";
		}
	}
	
	// 마이페이지 비밀번호 변경
	@GetMapping("/password")
	public String password(@RequestParam String userId, Model model) {
		model.addAttribute("userId", userId);
		return "ahzitUser/password";
	}
	
	@PostMapping("/password")
	public String password(AhzitUserDto ahzitUserDto, HttpSession session, @RequestParam String beforePw, // 사용자가 입력한 기존 비밀번호
			@RequestParam String afterPw) { // 사용자가 입력한 바꿀 비밀번호
			String userId = (String) session.getAttribute(SessionConstant.ID);

			// 비밀번호 검사
			AhzitUserDto ahzitUserDto1 = ahzitUserDao.selectOne(userId);
			
			boolean passwordMatch = encoder.matches(beforePw, ahzitUserDto1.getUserPw()); // 원본 비밀번호 랑 찾은 비밀번호랑 비교
//			System.out.println("userId"+ ahzitUserDto1.getUserPw());
//			System.out.println("beforePw"+ beforePw);
			
			if (!passwordMatch) {
				//System.out.println("dddddddddddddddd");
				return "redirect:password?error&userId=" + userId;
			}
			else {
		//	ahzitUserDto.setUserId(beforePw);
			ahzitUserDto.setUserPw(afterPw);
			
		//	System.out.println("userId"+ userId);
		//	System.out.println("입력 비밀번호"+afterPw);
		//	System.out.println("기존 비밀번호"+beforePw);
		//	System.out.println("getUserId = "+ahzitUserDto.getUserId());
		//	System.out.println("getUserPw = "+ahzitUserDto.getUserPw());
			
			// 암호화 과정
			String pw = ahzitUserDto.getUserPw(); 
			String enc = encoder.encode(pw); 
			ahzitUserDto.setUserPw(enc); 
		//	System.out.println("22"+userId);
		//	System.out.println("33"+afterPw);
			ahzitUserDao.changePw(ahzitUserDto); // 변경
		
			return "redirect:mypage";
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
		boolean passwordMatch = encoder.matches(userPw, ahzitUserDto.getUserPw()); // 원본 비밀번호 랑 찾은 비밀번호랑 비교
	//	boolean passwordMatch = userPw.equals(ahzitUserDto.getUserPw());
	
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
			@RequestParam String userEmail, Model model, HttpSession session) {
		
			List<Object> checkId = ahzitUserDao.checkId(userEmail);
		//	model.addAttribute("checkId", checkId);	

			if(checkId.isEmpty()) {
				return "redirect:checkId?error";
			}
			else {
				model.addAttribute("checkId", checkId);	
			}
			// System.out.println("아이디 값 = " + model.getAttribute("checkId"));
			return "ahzitUser/checkIdResult";
	}
	
	// 아이디 확인 페이지
		@GetMapping("/checkId_result")
		public String checkIdResult() {
			return "ahzitUser/checkIdResult";
		}
	
	// 비밀번호 찾기
		@GetMapping("/checkPw")
		public String checkPw() {
			return"ahzitUser/checkPw";
		}
		
		@PostMapping("/checkPw")
		@ResponseBody
		public Object checkPw(
				@RequestParam String userEmail, @RequestParam String userId, Model model) {
			
			// System.out.println("아이디 확인 = "+userId);
				Map<String,String>map = new HashMap<String,String>();
				map.put("userId", userId);
				map.put("userEmail", userEmail);
				
			//	System.out.println("아이디 확인 = "+userId);
			//	System.out.println("이메일 확인 = "+userEmail);
				int checkPw = ahzitUserDao.checkPw(map);
				System.out.println(checkPw);
		//		System.out.println("아이디, 이메일 확인 = "+checkPw);
				
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
					
					map.put("message", "확인");
					//model.addAttribute("userId", userId);
					System.out.println("성공");
					return "redirect:checkPw";
					}
				else {
					map.put("message", "입력된 회원정보가 존재하지 않습니다");
					System.out.println("실패");
					model.addAttribute("checkPw", checkPw);
				//	System.out.println("실패시 " + checkPw);
					return map;
				}
		}
		

		// 이메일 인증 후 비밀번호 변경
		@GetMapping("/checkPwSuccess")
		public String checkPwSuccess(@RequestParam String userId, Model model) {
		//	System.out.println("아이디 값 = " + userId);
			model.addAttribute("userId", userId);
			return"ahzitUser/checkPwSuccess";
		}
		
		@PostMapping("/checkPwSuccess")
		public String checkPwSuccess(AhzitUserDto ahzitUserDto, @RequestParam String userId, @RequestParam String userPw) {
			
			ahzitUserDto.setUserId(userId);
		
			// 암호화 과정
			String pw = ahzitUserDto.getUserPw(); 
			String enc = encoder.encode(pw); 
			ahzitUserDto.setUserPw(enc); 
			
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
		
		// 내가 가입한 아지트
		@GetMapping("/myAhzit")
		public String myAhzit(Model model, HttpSession session, @ModelAttribute MyAhzitVO myAhzitVO) {
			String loginId = (String) session.getAttribute(SessionConstant.ID);
		
			List<MyAhzitVO> myAhzit = ahzitUserDao.myAhzit(loginId);
	
			model.addAttribute("myAhzit", myAhzit);
			return "ahzitUser/myAhzit";
		}
}
