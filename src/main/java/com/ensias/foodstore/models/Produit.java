package com.ensias.foodstore.models;

import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(name = "produits")
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom", nullable = false)
    private String nom;

    @Column(name = "prix_ht", nullable = false)
    private Double prixHt;

    @Lob
    @Column(name = "details", nullable = false)
    private String details;

    @Lob
    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "photo_principale", nullable = false)
    private String photoPrincipale;

    @Column(name = "featured", nullable = false)
    private Boolean featured = false;

    @Lob
    @Column(name = "images")
    private String images;

    @Column(name = "quantite", nullable = false)
    private Integer quantite;

    @Column(name = "rating_count")
    private Integer ratingCount;

    @Column(name = "rating_cache")
    private Double ratingCache;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "categorie_id")
    private Categorie categorie;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    @Column(name = "created_at")
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPrixHt() {
        return prixHt;
    }

    public void setPrixHt(Double prixHt) {
        this.prixHt = prixHt;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhotoPrincipale() {
        return photoPrincipale;
    }

    public void setPhotoPrincipale(String photoPrincipale) {
        this.photoPrincipale = photoPrincipale;
    }

    public Boolean getFeatured() {
        return featured;
    }

    public void setFeatured(Boolean featured) {
        this.featured = featured;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Integer getQuantite() {
        return quantite;
    }

    public void setQuantite(Integer quantite) {
        this.quantite = quantite;
    }

    public Integer getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(Integer ratingCount) {
        this.ratingCount = ratingCount;
    }

    public Double getRatingCache() {
        return ratingCache;
    }

    public void setRatingCache(Double ratingCache) {
        this.ratingCache = ratingCache;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

}