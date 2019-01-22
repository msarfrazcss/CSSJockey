package com.ats.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.model.Department;
import com.ats.service.ATSUtils;
import com.ats.service.DepartmentService;

import org.codehaus.jackson.map.ObjectMapper;

@Controller
@RequestMapping("/admin")
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value="/departments", method=RequestMethod.GET)
    public String departments(Model model) {
		try {
			ObjectMapper mapper = new ObjectMapper();
	        model.addAttribute("departmentList", mapper.writeValueAsString(departmentService.getDepartmentList()));
	        
	        model.addAttribute("departments_part", ATSUtils.active1);
			model.addAttribute("departments_full", ATSUtils.active2);
			model.addAttribute("departmentsAll_part", ATSUtils.active1);
			model.addAttribute("departmentsAll_full", ATSUtils.active2);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return "admin/departments2"; 
    }
	
	@RequestMapping("/departments/create")  
    public String createDepartment(@ModelAttribute("department") Department department, BindingResult result, Model model){
		model.addAttribute("departments_part", ATSUtils.active1);
		model.addAttribute("departments_full", ATSUtils.active2);
		model.addAttribute("departmentsAll_part", ATSUtils.active1);
		model.addAttribute("departmentsAll_full", ATSUtils.active2);
        return "admin/departments_add";  
    }
	
    @RequestMapping(value="/departments/create", method=RequestMethod.POST)  
    public String createDepartmentDetails(@ModelAttribute("department") Department department, BindingResult result){
    	int depID = departmentService.addDepartment(department);
    	System.out.println("Department created: "+ depID);
  		return "redirect:/admin/departments";
    }
    
    @RequestMapping(value="/departments/edit/{id}", method=RequestMethod.GET)
	public String editDepartment(@PathVariable("id") int id, @ModelAttribute("department") Department department, BindingResult result, Model model) {
    	model.addAttribute("departments_part", ATSUtils.active1);
		model.addAttribute("departments_full", ATSUtils.active2);
		model.addAttribute("departmentsAll_part", ATSUtils.active1);
		model.addAttribute("departmentsAll_full", ATSUtils.active2);
		
		model.addAttribute("department", departmentService.getDepartmentById(id));
		return "admin/departments_edit";
	}
    
    @RequestMapping(value="/departments/edit", method=RequestMethod.POST)
	public String editDepartmentDetails(@ModelAttribute("department") Department department, BindingResult result) {
    	departmentService.updateDepartment(department);
		return "redirect:/admin/departments";
	}
      
    @RequestMapping("/departments/delete/{id}")
    public String deleteSubDepartment(@PathVariable("id") int id){
    	departmentService.deleteDepartment(id);
        return "redirect:/admin/departments";
    }
    
}
