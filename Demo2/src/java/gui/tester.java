/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import basic.Account;
import dao.AccountDao;
import java.util.ArrayList;

/**
 *
 * @author PhuHV
 */
public class tester {
    public static void main(String[] args) {
        try {
            ArrayList<Account> list = AccountDao.getAccounts();
            for (Account account : list) {
                System.out.println(account);
            }
        } catch (Exception e) {
        }
        
        try {
            Account acc = AccountDao.getAccount("tung@gmail.com", "123");
            System.out.println(acc);
        } catch (Exception e) {
        }
        
        try {
            if (AccountDao.updateAccount(5,"haha@gmail.com", "1231", "hihihi", "03423", 0, 0) == 1) {
                System.out.println("update successfully");
            } else {
                System.out.println("update fail");
            }
        } catch (Exception e) {
        }
    }
}
