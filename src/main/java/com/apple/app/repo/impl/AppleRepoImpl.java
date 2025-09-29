package com.apple.app.repo.impl;

import com.apple.app.entity.AppleEntity;
import com.apple.app.entity.LoginEntity;
import com.apple.app.repo.AppleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Repository
public class AppleRepoImpl implements AppleRepo {

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean dataSaved(AppleEntity appleEntity) {
        System.out.println(appleEntity);
        System.out.println("Repo invoked");
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            manager.persist(appleEntity);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            manager.close();
        }
    }

    @Override
    public AppleEntity emailAvaliability(String email) {
        EntityManager manager = factory.createEntityManager();
        try {
            Query query = manager.createNamedQuery("checkEmail");
            query.setParameter("mail", email);

            List<AppleEntity> results = query.getResultList();
            if (results.isEmpty()) {
                System.out.println("No email found: " + email);
                return null;
            }
            System.out.println("Email exists: " + results.get(0).getEmail());
            return results.get(0);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            manager.close();
        }
    }


    @Override
    public AppleEntity phoneAvaliability(String phone) {
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("phoneCheck");
            query.setParameter("ph", phone);
            return (AppleEntity) query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            manager.close();
        }
    }

    @Override
    public AppleEntity passwordAvaliablitiy(String password) {
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("passwordCheck");
            query.setParameter("pass", password);
            return (AppleEntity) query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            manager.close();
        }
    }

    @Override
    public boolean updateUser(AppleEntity entity) {
        System.out.println(entity);
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            manager.merge(entity);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            manager.close();
        }
    }

    @Override
    public void resetOtp() {
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            Query query = manager.createNamedQuery("clearOtp");
            query.executeUpdate();
            manager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            manager.close();
        }
    }


    @Override
    public boolean loginDetails(LoginEntity entity) {
        EntityManager manager = factory.createEntityManager();
        try {
            manager.getTransaction().begin();
            manager.persist(entity);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            manager.close();
        }
    }


}

