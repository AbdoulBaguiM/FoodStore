package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Categorie;

import java.util.List;

public interface CategorieDaoInterface {

    List<Categorie> getAllCategories();

    Categorie getCategorieById(int categorieId);

    void addCategorie(Categorie categorie);

    void updateCategorie(Categorie categorie);

    void deleteCategorie(Categorie categorie);
}
