﻿<?php
	class Controller_main extends Controller {
		
		function __construct()
		{
			$this->view = new View();
			$this->model = new Model_customer();
		}
		function action_index()
		{
			$filter = array();
			
			if(isset($_GET['authors']))
			{
				$filter['authors'] = $_GET['authors'];
			}
			
			if(isset($_GET['genres']))
			{
				$filter['genres'] = $_GET['genres'];
			}
			
			$data = $this->model->select_item('author');
			$_POST['authors'] = $data;
			
			$data = $this->model->select_item('genre');
			$_POST['genres'] = $data;
			
			$data = $this->model->select_book($filter);
			
			if(is_string($data))
			{
				$this->view->generate('view_main_message.php',$data);
			}
			else
			{
				$_POST['books'] = $data;
				$this->view->generate('view_main.php');
			}
		}
		function action_bookdetails()
		{
			$id = $_POST['id_item'];
			$book = $this->model->select_book_det($id);
			
			$_POST['book'] = $book;

			$this->view->generate('view_bookdetails.php');
		}
		function action_order()
		{
			$id = $_POST['id_item'];
			
			$this->view->generate('view_order.php');
		}
		function action_order_res()
		{
			$id = $_POST['id_item'];
			
			$addres = $_POST['addres'];
			$customer = $_POST['customer'];
			$number = $_POST['number'];
			
			$order = $this->model->order($id, $addres, $customer, $number);
			
			$this->view->generate('view_main.php', $order);
		}
	}
?>