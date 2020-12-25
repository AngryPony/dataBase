<?php
require_once ("config.php");
require_once("domain/DB.php");



require_once("infrastructure/AddressRep.php");
require_once("infrastructure/DoctorRep.php");
require_once("infrastructure/MedicineRep.php");
require_once("infrastructure/OrderRep.php");
require_once("infrastructure/OrderTypeRep.php");
require_once("infrastructure/PatientRep.php");
require_once("infrastructure/PharmacyRep.php");
require_once("infrastructure/PrescriptionRep.php");
require_once("infrastructure/ReviewsRep.php");
require_once("infrastructure/StockRep.php");
require_once("infrastructure/StorehouseRep.php");


$path = explode('?', $_SERVER['REQUEST_URI'])[0];
$path = explode('/', $path);
$db = new DB();
$rep = new StorehouseRep($db);


if(count($path) == 3){
    include ("view/header.php");
    include("view/".$path[2].".php");
}else if(count($path) == 4 && $path[2] == "edit"){
    include ("view/header.php");
    include("view/edit/".$path[3].".php");
}else if(count($path) == 4 && $path[2] == "add"){
    include ("view/header.php");
    include("view/add/".$path[3].".php");
}else if(count($path) == 4 && $path[2] == "save"){
    if($path[3] == "address"){
        $rep = new AddressRep($db);
        $rep->update(Address::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "doctor"){
        $rep = new DoctorRep($db);
        $rep->update(Doctor::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "medicine"){
        $rep = new MedicineRep($db);
        $rep->update(Medicine::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "order"){
        $rep = new OrderRep($db);
        $rep->update(Order::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "order_type"){
        $rep = new OrderTypeRep($db);
        $rep->update(OrderType::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "patient"){
        $rep = new PatientRep($db);
        $rep->update(Patient::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "pharmacy"){
        $rep = new PharmacyRep($db);
        $rep->update(Pharmacy::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "review"){
        $rep = new ReviewsRep($db);
        $rep->update(Reviews::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "stock"){
        $rep = new StockRep($db);
        $rep->update(Stock::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "storehouse"){
        $rep = new StorehouseRep($db);
        $rep->update(Storehouse::fromAssocArray($_GET));
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }
}else if(count($path) == 4 && $path[2] == "remove"){
    if($path[3] == "address"){
        $rep = new AddressRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "doctor"){
        $rep = new DoctorRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "medicine"){
        $rep = new MedicineRep($db);
        $rep->update(Medicine::fromAssocArray($_GET));
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "order"){
        $rep = new OrderRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "order_type"){
        $rep = new OrderTypeRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "patient"){
        $rep = new PatientRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "pharmacy"){
        $rep = new PharmacyRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "review"){
        $rep = new ReviewsRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "stock"){
        $rep = new StockRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }else if($path[3] == "storehouse"){
        $rep = new StorehouseRep($db);
        $rep->delete($_GET["id"]);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }
}else if(count($path) == 4 && $path[2] == "insert"){
    if($path[3] == "address"){
        $rep = new AddressRep($db);
        $rep->create(Address::fromAssocArray($_GET));
        header("Location: /bd/addresses");
    }else if($path[3] == "doctor"){
        $rep = new DoctorRep($db);
        $rep->create(Doctor::fromAssocArray($_GET));
        header("Location: /bd/doctors");
    }else if($path[3] == "medicine"){
        $rep = new MedicineRep($db);
        $rep->create(Medicine::fromAssocArray($_GET));
        header("Location: /bd/medicines");
    }else if($path[3] == "order"){
        $rep = new OrderRep($db);
        $rep->create(Order::fromAssocArray($_GET));
        header("Location: /bd/orders");
    }else if($path[3] == "order_type"){
        $rep = new OrderTypeRep($db);
        $rep->create(OrderType::fromAssocArray($_GET));
        header("Location: /bd/order_types");
    }else if($path[3] == "patient"){
        $rep = new PatientRep($db);
        $rep->create(Patient::fromAssocArray($_GET));
        header("Location: /bd/patients");
    }else if($path[3] == "pharmacy"){
        $rep = new PharmacyRep($db);
        $rep->create(Pharmacy::fromAssocArray($_GET));
        header("Location: /bd/pharmacy");
    }else if($path[3] == "review"){
        $rep = new ReviewsRep($db);
        $rep->create(Reviews::fromAssocArray($_GET));
        header("Location: /bd/reviews");
    }else if($path[3] == "stock"){
        $rep = new StockRep($db);
        $rep->create(Stock::fromAssocArray($_GET));
        header("Location: /bd/stocks");
    }else if($path[3] == "storehouse"){
        $rep = new StorehouseRep($db);
        $rep->create(Storehouse::fromAssocArray($_GET));
        header("Location: /bd/storehouses");
    }
}


$db->close();
include ("view/footer.php");