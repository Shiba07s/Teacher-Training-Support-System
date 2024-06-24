package com.TTSS03.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class AController {

	 @GetMapping("/authentication")
	    public ModelAndView authenticationPage() {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("/../../authentication"); // Set the view name
//	        modelAndView.addObject("firstLogoPath", "/assets/logo1Transparent.png"); // Add first logo path to the model
//	        modelAndView.addObject("secondLogoPath", "/assets/logo2Transparent.png"); // Add second logo path to the model
	        return modelAndView;
	    }
	@GetMapping("/admin")
	public String adminPage() {
		return "/../../MainFrameAdmin";
		
	}
	@GetMapping("/trainee")
	public String traineePage() {
		return "redirect:/mainFrameTrainee.jsp";
		
	}
	@GetMapping("/dashboard")
	public String dashboardPage() {
		return "redirect:/dashboard.jsp";
		
	}
	@GetMapping("/MasterSetupScreen")
	public String MasterSetupScreenPage() {
		return "/../../MasterSetupScreen";
		
	}
	@GetMapping("/index")
	public String landingPage() {
		return "/../../index";
		
	}
	@GetMapping("/schedule")
	public String schedulePage() {
		return "/../../Schedule1";
		
	}
	@GetMapping("/mainframeCOMMISIONER")
	public String mainframeCOMMISIONERPage() {
		return "/../../mainframeCOMMISIONER";
		
	}
	@GetMapping("/mainframeDYEO")
	public String mainframeDYEOPage() {
		return "/../../mainframeDYEO";
		
	}
	@GetMapping("/mainframeDIET")
	public String mainframeDIETPage() {
		return "/../../mainframeDIET";
		
	}
	@GetMapping("/mainframeRJD")
	public String mainframeRJDPage() {
		return "/../../mainframeRJD";
		
	}
	@GetMapping("/dashboardMEO")
	public String dashboardMEOPage() {
		return "/../../dashboardMEO";
		
	}
	@GetMapping("/mainframeHM")
	public String mainframeHMPage() {
		return "/../../mainframeHM";
		
	}
	@GetMapping("/mainframeMEO")
	public String mainframeMEOPage() {
		return "/../../mainframeMEO";
		
	}
	@GetMapping("/mainframeDEO")
	public String mainframeDEOPage() {
		return "/../../mainframeDEO";
		
	}
	@GetMapping("/mainframeSAMO")
	public String mainframeSAMOPage() {
		return "/../../mainframeSAMO";
		
	}
	@GetMapping("/dashboardSPD")
	public String dashboardSPDPage() {
		return "/../../dashboardSPD";
		
	}
	@GetMapping("/dashboardDEO")
	public String dashboardDEOPage() {
		return "/../../dashboardDEO";
		
	}
	@GetMapping("/mainframeSCERT")
	public String mainframeSCERTPage() {
		return "/../../mainframeSCERT";
		
	}
	@GetMapping("/mainframeSEMAT")
	public String mainframeSEMATPage() {
		return "/../../mainframeSEMAT";
		
	}
	@GetMapping("/mainframeSPD")
	public String mainframeSPDPage() {
		return "/../../mainframeSPD";
		
	}
	@GetMapping("/mainframeSuperAdmin")
	public String mainframeSuperAdminPage() {
		return "/../../mainframeSuperAdmin";
		
	}
	  

}
