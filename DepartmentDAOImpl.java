package com.ats.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ats.model.Department;

@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public int addDepartment(Department department) {
		Session session = this.sessionFactory.getCurrentSession();
//		session.persist(user);
		
		int dapID = (Integer)session.save(department);
		System.out.println("Department saved successfully... ");
		return dapID;
	}

	@Override
	public void updateDepartment(Department department) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(department);
		System.out.println("Department updated successfully...");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartmentList() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Department> departmentsList = session.createQuery("FROM Department ORDER BY id DESC").list();
		return departmentsList;
	}

	@Override
	public Department getDepartmentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Department department = (Department) session.load(Department.class, new Integer(id));
		Hibernate.initialize(department);
		return department;
	}

	@Override
	public void deleteDepartment(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Department department = (Department) session.load(Department.class, new Integer(id));
		if(department!=null){
			session.delete(department);
		}
		System.out.println("Department deleted successfully...");
	}
	
	
}
