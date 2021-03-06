package com.ensias.foodstore.models;

import jakarta.persistence.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "commandes")
public class Commande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "c_nom", nullable = false)
    private String cNom;

    @Column(name = "c_prenom")
    private String cPrenom;

    @Column(name = "c_email", nullable = false)
    private String cEmail;

    @Column(name = "c_adresse", nullable = false)
    private String cAdresse;

    @Column(name = "c_ville", nullable = false)
    private String cVille;

    @Column(name = "c_zipcode", nullable = false)
    private String cZipcode;

    @Column(name = "c_telephone", nullable = false)
    private String cTelephone;

    @Column(name = "c_discount")
    private Integer cDiscount;

    @Column(name = "c_discountCode")
    private String cDiscountcode;

    @Column(name = "c_subtotal", nullable = false)
    private double cSubtotal;

    @Column(name = "c_taxe")
    private Integer cTaxe;

    @Column(name = "c_total", nullable = false)
    private double cTotal;

    @Column(name = "c_payement")
    private Boolean cPayement;

    @Column(name = "statut", nullable = false)
    private int statut = 0;

    @Column(name = "erreur")
    private String erreur;

    @Column(name = "created_at")
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @OneToMany(mappedBy = "commande")
    private List<CommandeProduit> commandeProduits = new ArrayList<CommandeProduit>();

    public List<CommandeProduit> getCommandeProduits() {
        return commandeProduits;
    }

    public void setCommandeProduits(List<CommandeProduit> commandeProduits) {
        this.commandeProduits = commandeProduits;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCNom() {
        return cNom;
    }

    public void setCNom(String cNom) {
        this.cNom = cNom;
    }

    public String getCPrenom() {
        return cPrenom;
    }

    public void setCPrenom(String cPrenom) {
        this.cPrenom = cPrenom;
    }

    public String getCEmail() {
        return cEmail;
    }

    public void setCEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public String getCAdresse() {
        return cAdresse;
    }

    public void setCAdresse(String cAdresse) {
        this.cAdresse = cAdresse;
    }

    public String getCVille() {
        return cVille;
    }

    public void setCVille(String cVille) {
        this.cVille = cVille;
    }

    public String getCZipcode() {
        return cZipcode;
    }

    public void setCZipcode(String cZipcode) {
        this.cZipcode = cZipcode;
    }

    public String getCTelephone() {
        return cTelephone;
    }

    public void setCTelephone(String cTelephone) {
        this.cTelephone = cTelephone;
    }

    public Integer getCDiscount() {
        return cDiscount;
    }

    public void setCDiscount(Integer cDiscount) {
        this.cDiscount = cDiscount;
    }

    public String getCDiscountcode() {
        return cDiscountcode;
    }

    public void setCDiscountcode(String cDiscountcode) {
        this.cDiscountcode = cDiscountcode;
    }

    public double getCSubtotal() {
        return cSubtotal;
    }

    public void setCSubtotal(double cSubtotal) {
        this.cSubtotal = cSubtotal;
    }

    public Integer getCTaxe() {
        return cTaxe;
    }

    public void setCTaxe(Integer cTaxe) {
        this.cTaxe = cTaxe;
    }

    public double getCTotal() {
        return cTotal;
    }

    public void setCTotal(double cTotal) {
        this.cTotal = cTotal;
    }

    public Boolean getCPayement() {
        return cPayement;
    }

    public void setCPayement(Boolean cPayement) {
        this.cPayement = cPayement;
    }

    public int getStatut() {
        return statut;
    }

    public void setStatut(int statut) {
        this.statut = statut;
    }

    public String getErreur() {
        return erreur;
    }

    public void setErreur(String erreur) {
        this.erreur = erreur;
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