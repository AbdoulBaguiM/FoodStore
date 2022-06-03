
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach var="commande" items="${commandes}">
    <div class="order-container">
        <div class="order-header">
            <div class="order-header-items">
                <div>
                    <div class="uppercase font-bold">Date Commande</div>
                    <div align="center">${commande.createdAt}</div>
                </div>
                <div>
                    <div class="uppercase font-bold">Commande N°</div>
                    <div align="center">${commande.id}</div>
                </div>
                <div>
                    <div class="uppercase font-bold">Total</div>
                    <div>${commande.CTotal} Dhs</div>
                </div>
            </div>
            <div>
                <div class="order-header-items">
                    <div><a href="#${commande.id}" rel="modal:open">Details</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="${commande.id}">
            <!-- Start address Section -->
            <tr>
                <td style="padding-top: 0;">
                    <table align="center" cellpadding="0" cellspacing="0"
                           border="0" class="devicewidthinner"
                           style="border-bottom: 1px solid #bbbbbb;">
                        <tbody>
                        <tr>
                            <td style="width: 55%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                Adresse de Livraison
                            </td>
                            <td style="width: 45%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                Informations Client
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    ${commande.CAdresse}
                            </td>
                            <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    ${commande.CNom} ${commande.CPrenom}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    ${commande.CVille}, ${commande.CZipcode}
                            </td>
                            <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    ${commande.CTelephone}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <!-- End address Section -->

            <!-- Start product Section -->
            <c:forEach var="commandeProduit"
                       items="${commande.commandeProduits}">
                <tr>
                    <td style="padding-top: 0;">
                        <table align="center" cellpadding="0" cellspacing="0"
                               border="0" class="devicewidthinner"
                               style="border-bottom: 1px solid #eeeeee;">
                            <tbody>
                            <tr>
                                <td rowspan="4"
                                    style="padding-right: 10px; padding-bottom: 10px;">
                                    <img style="height: 80px;"
                                         src="/assets/img/${commandeProduit.produit.photoPrincipale}"
                                         alt="Product Image"/>
                                </td>
                                <td colspan="2"
                                    style="font-size: 14px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                        ${commandeProduit.produit.nom}
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #757575; width: 440px;">
                                    Quantité: ${commandeProduit.quantite}
                                </td>
                                <td style="width: 130px;"></td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #757575;"></td>
                                <td style="font-size: 14px; line-height: 18px; color: #757575; text-align: right;">
                                        ${commandeProduit.quantite}
                                    x ${commandeProduit.produit.prixHt} DHS
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </c:forEach>
            <!-- End product Section -->

            <a class="secondary-btn" href="#" rel="modal:close"
               style="margin-left: 70%">Fermer</a>
        </div>
        <div class="order-products">
            <c:forEach var="commandeProduit"
                       items="${commande.commandeProduits}">
                <div class="order-product-item">
                    <div>
                        <a href="/produit?id=${commandeProduit.produit.id}">
                            <img src="/assets/img/${commandeProduit.produit.photoPrincipale}"
                                 alt="Photo Produit">
                        </a>
                    </div>
                    <div>
                        <div>
                            <a href="/produit?id=${commandeProduit.produit.id}">${commandeProduit.produit.nom}</a>
                        </div>
                        <div>${commandeProduit.produit.prixHt} Dhs</div>
                        <div>Quantité: ${commandeProduit.quantite}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- end order-container -->
</c:forEach>
</body>
</html>
