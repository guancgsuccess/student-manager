package com.tz.controller;

import com.tz.entity.Children;
import com.tz.entity.Menu;
import com.tz.entity.MenuJsonVo;
import com.tz.entity.MenuVo;
import com.tz.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 *菜单控制器
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService menuService;

    @RequestMapping("/list")
    public String list() {
        return "menu/list";
    }

    @RequestMapping("/query")
    @ResponseBody
    public List<Menu> query() {
        List<Menu> list = menuService.findAll();
        return list;
    }

    @RequestMapping("/saveNodes")
    @ResponseBody
    public String saveNodes(Menu menu) {
        menuService.saveNodes(menu);
        return "success";
    }

    /**
     * 删除节点
     */
    @RequestMapping("/deleteNodes")
    @ResponseBody
    public String deleteNodes(Menu menu) {
        menuService.deleteNodes(menu);
        return "success";
    }

    /**
     * 更新节点
     **/
    @RequestMapping("/updateNodes")
    @ResponseBody
    public String updateNodes(Menu menu) {
        String newName = menu.getName();
        menu = menuService.getById(menu.getId());
        menu.setName(newName);
        menuService.update(menu);
        return "success";
    }

    /**
     * 根据菜单的id来加载
     */
    @RequestMapping("/getById")
    @ResponseBody
    public Menu getById(Integer id) {
        Menu menu = menuService.getById(id);
        return menu;
    }

    /**
     * 更新菜单的路径
     */
    @RequestMapping("/updateUrl")
    @ResponseBody
    public String updateUrl(Menu menu) {
        System.out.println("menu:" + menu);
        String mUrl = menu.getmUrl();
        Menu m = menuService.getById(menu.getId());
        m.setmUrl(mUrl);
        menuService.update(m);
        return "success";
    }

    @RequestMapping("/menuIndex")
    @ResponseBody
    public List<Menu> menuIndex(){
        List<Menu> list = menuService.findAll();
       /* MenuJsonVo jsonVo = new MenuJsonVo();
        List<Menu> menuList = menuService.findParentByPid(0);

        if(null!=menuList && menuList.size()>0){
            List<MenuVo> menuVos = new ArrayList<>();
            for(Menu m:menuList){
                MenuVo vo = new MenuVo();
                vo.setName(m.getName());

                //查询当前节点下面的所有的子节点.
                List<Menu> subMenu = menuService.findParentByPid(m.getId());

                System.out.println(subMenu);
                if(null!=subMenu && subMenu.size()>0){
                    List<Children> children = new ArrayList<>();
                    for(Menu m1:subMenu){
                        Children c = new Children();
                        c.setName(m1.getName());
                        c.setHref(req.getContextPath()+m1.getmUrl());
                        children.add(c);
                        vo.setChildren(children);
                    }
                    menuVos.add(vo);
                }
                jsonVo.setMenuVo(menuVos);
            }
        }*/
        return list;
    }
}