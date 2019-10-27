/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.24 : Database - jeesite
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jeesite` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jeesite`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('22e35ac870964e16843eb5a7a5de1f4f',1,'test_audit.png','436f7d5e230c4f06aed23fad75d1b136','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F�����8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i���|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh����W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h��iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r�	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5��V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh���@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c����̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m���1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai��)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK����`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�����������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0),
('7c901520c2264c869dffd0ec697269f8',1,'test_audit.bpmn20.xml','436f7d5e230c4f06aed23fad75d1b136','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),
('abd3dda0e4404f6696ba97dd07f316bf',1,'source',NULL,'{\"id\":\"canvas\",\"resourceId\":\"canvas\",\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"}}',NULL);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values 
('next.dbid','1',1),
('schema.history','create(5.15.1) upgrade(5.16->5.21.0.0)',2),
('schema.version','5.21.0.0',2);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values 
('436f7d5e230c4f06aed23fad75d1b136','SpringAutoDeployment',NULL,'','2017-06-07 20:30:50.365');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values 
('04f55d490b5d41f68dddc6a52ef44b1b',2,'test_aduit','test_aduit','1','2017-06-20 15:44:58','2017-06-20 15:44:59',1,'{\"name\":\"test_aduit\",\"revision\":1,\"description\":\"测试流程审批实例\"}',NULL,'abd3dda0e4404f6696ba97dd07f316bf',NULL,'');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`HAS_GRAPHICAL_NOTATION_`) values 
('test_audit:1:d22cba8ebc07404e82582a54a9dc2ad2',3,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'436f7d5e230c4f06aed23fad75d1b136','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'',1);

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','3','111111111111111标题','','green','','关键字1,关键字2','',0,'2017-07-02 00:00:00',4,',null,','','','1','2013-05-27 08:00:00','1','2017-07-01 13:02:55',NULL,'0'),
('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('37','13','文章标题标题标题标题','','','','关键字1,关键字2','',0,'2017-07-13 00:00:00',0,',null,','','','1','2013-05-30 08:00:00','1','2017-07-01 13:02:17',NULL,'0'),
('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,5,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `copyfrom` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values 
('1','<p>\r\n	文章内容内容内容内容</p>','来源','1,2,3,','1'),
('10','文章内容内容内容内容','来源','1,2,3','1'),
('11','文章内容内容内容内容','来源','1,2,3','1'),
('12','文章内容内容内容内容','来源','1,2,3','1'),
('13','文章内容内容内容内容','来源','1,2,3','1'),
('14','文章内容内容内容内容','来源','1,2,3','1'),
('15','文章内容内容内容内容','来源','1,2,3','1'),
('16','文章内容内容内容内容','来源','1,2,3','1'),
('17','文章内容内容内容内容','来源','1,2,3','1'),
('18','文章内容内容内容内容','来源','1,2,3','1'),
('19','文章内容内容内容内容','来源','1,2,3','1'),
('2','文章内容内容内容内容','来源','1,2,3','1'),
('20','文章内容内容内容内容','来源','1,2,3','1'),
('21','文章内容内容内容内容','来源','1,2,3','1'),
('22','文章内容内容内容内容','来源','1,2,3','1'),
('23','文章内容内容内容内容','来源','1,2,3','1'),
('24','文章内容内容内容内容','来源','1,2,3','1'),
('25','文章内容内容内容内容','来源','1,2,3','1'),
('26','文章内容内容内容内容','来源','1,2,3','1'),
('27','文章内容内容内容内容','来源','1,2,3','1'),
('28','文章内容内容内容内容','来源','1,2,3','1'),
('29','文章内容内容内容内容','来源','1,2,3','1'),
('3','文章内容内容内容内容','来源','1,2,3','1'),
('30','文章内容内容内容内容','来源','1,2,3','1'),
('31','文章内容内容内容内容','来源','1,2,3','1'),
('32','文章内容内容内容内容','来源','1,2,3','1'),
('33','文章内容内容内容内容','来源','1,2,3','1'),
('34','文章内容内容内容内容','来源','1,2,3','1'),
('35','文章内容内容内容内容','来源','1,2,3','1'),
('36','文章内容内容内容内容','来源','1,2,3','1'),
('37','<p>\r\n	文章内容内容内容内容</p>','来源','1,2,3,','1'),
('38','文章内容内容内容内容','来源','1,2,3','1'),
('39','文章内容内容内容内容','来源','1,2,3','1'),
('4','文章内容内容内容内容','来源','1,2,3','1'),
('40','文章内容内容内容内容','来源','1,2,3','1'),
('41','文章内容内容内容内容','来源','1,2,3','1'),
('42','文章内容内容内容内容','来源','1,2,3','1'),
('43','文章内容内容内容内容','来源','1,2,3','1'),
('44','文章内容内容内容内容','来源','1,2,3','1'),
('45','文章内容内容内容内容','来源','1,2,3','1'),
('46','文章内容内容内容内容','来源','1,2,3','1'),
('47','文章内容内容内容内容','来源','1,2,3','1'),
('48','文章内容内容内容内容','来源','1,2,3','1'),
('49','文章内容内容内容内容','来源','1,2,3','1'),
('5','文章内容内容内容内容','来源','1,2,3','1'),
('50','文章内容内容内容内容','来源','1,2,3','1'),
('51','文章内容内容内容内容','来源','1,2,3','1'),
('52','文章内容内容内容内容','来源','1,2,3','1'),
('53','文章内容内容内容内容','来源','1,2,3','1'),
('6','文章内容内容内容内容','来源','1,2,3','1'),
('7','文章内容内容内容内容','来源','1,2,3','1'),
('8','文章内容内容内容内容','来源','1,2,3','1'),
('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) COLLATE utf8_bin DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','0,1,','1','3','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','1','0,1,','1','3','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) COLLATE utf8_bin DEFAULT 'default' COMMENT '主题',
  `copyright` text COLLATE utf8_bin COMMENT '版权信息',
  `custom_index_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0a41bf2c3f5540ac93a955bd806edd49','员工评价','curd','com.thinkgem.jeesite.modules','staff','','员工评价模块','员工评价','liuji','9086c2a199e74a60b2ad766ea7d87637','1','2017-06-20 20:33:39','1','2017-06-20 20:35:51','','0'),
('1ae390f52a0a47a597bb3a7d82f219ae','元属性模板','curd','com.thinkgem.jeesite.modules','sys','','员工元属性模板','员工元属性模板','zhangyawei','1f73d351eeb84ec6bb8c0b69f89ef692','1','2017-06-22 16:43:27','1','2017-06-22 16:43:27','','0'),
('28bc57e664184302b07b0d0908b5ebfb','工作经历','curd_many','com.thinkgem.jeesite.modules','staff','','员工工作经历','员工工作经历','liuji','4a5edb06bcee41b89f1f9c0826765669','1','2017-06-20 10:07:29','1','2017-06-21 10:05:54','','0'),
('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test',NULL,'树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4ed6afd9217d4368bc2a7cb9af4088a1','元属性配置','curd','com.thinkgem.jeesite.modules','sys','','元属性配置','单表','zhangyawei','13867fd19a804587b5b67944719cac58','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 11:14:22','1','2017-06-22 16:17:33','','0'),
('9c9de9db6da743bb899036c6546061ac','档案管理','curd','com.thinkgem.jeesite.modules','staff','','单表生成','单表','liuji','21270fc4599d4586b1447ee983414574','1','2013-08-12 13:10:05','1','2017-06-19 22:31:41','','0'),
('b9f969691b4d4be8826679cafc892024','11111','curd','com.thinkgem.jeesite.modules','a','a','a','a','a','4a5edb06bcee41b89f1f9c0826765669','1','2018-09-06 14:45:29','1','2018-09-06 14:48:03','','0'),
('bda3f13db9db4dc3b3087c071ed3a557','档案信息','curd','com.thinkgem.jeesite.modules','staff','','员工档案信息','员工档案','liuji','93ef5b587da7485aa048225d649eb80b','1','2017-06-22 11:15:16','1','2017-06-22 11:15:16','','0'),
('c0a080d72fe54bb9b18b34e23ea13ec0','角色属性配置','curd_many','com.thinkgem.jeesite.modules','staff','','角色对应的模板和属性设置','角色对应的属性','liuji','6eee2ea2481f44a19b76d067bdfdb18f','1','2017-06-27 10:48:24','1','2017-06-27 10:48:24','','0'),
('d8bfb2014c794bb09cdea41cc44b7b51','单表','curd','com.thinkgem.jeesite.modules','sys','','单表生成','单表','zhangyawei','13867fd19a804587b5b67944719cac58','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:52:43','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:52:43','','0'),
('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('13867fd19a804587b5b67944719cac58','staff_prop','员工元属性表','StaffProp','','','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','','0'),
('1f73d351eeb84ec6bb8c0b69f89ef692','staff_template','员工元属性模板表','StaffTemplate','','','1','2017-06-22 16:32:56','1','2017-06-22 16:32:56','','0'),
('21270fc4599d4586b1447ee983414574','staff_edu','员工教育经历表','StaffEdu','','staff_id','1','2017-06-19 22:31:02','1','2018-08-27 14:29:13','','0'),
('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4a5edb06bcee41b89f1f9c0826765669','staff_work_exp','员工工作经历表','StaffWorkExp','sys_user','staff_id','1','2017-06-20 10:05:16','1','2017-06-21 10:05:23','','0'),
('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('6eee2ea2481f44a19b76d067bdfdb18f','staff_role_prop','员工元属性模板关系表','StaffRoleProp','sys_role','role_id','1','2017-06-27 10:45:38','1','2017-06-27 10:45:38','','0'),
('9086c2a199e74a60b2ad766ea7d87637','staff_eval','员工评价信息表','StaffEval','sys_user','staff_id','1','2017-06-20 20:28:20','1','2017-06-20 20:28:20','','0'),
('93ef5b587da7485aa048225d649eb80b','staff_prop_answer','员工元属性信息表','StaffPropAnswer','','','1','2017-06-22 11:13:08','1','2017-06-22 11:13:08','','0'),
('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','档案表','TestData','','','1','2013-08-12 13:10:05','1','2017-06-19 16:47:45','','0'),
('e3fad009b5264d25ad6ea4dc9234ec4b','sys_user','用户表','SysUser','','','1','2017-06-08 13:34:31','1','2017-06-08 13:34:31','','0'),
('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('010a2100545341dfaf376bbb954d8727','6eee2ea2481f44a19b76d067bdfdb18f','role_id','角色id','varchar(64)','String','roleId','0','1','1','1','0','0','=','input','',NULL,20,'1','2017-06-27 10:45:38','1','2017-06-27 10:45:38',NULL,'0'),
('01f457211f1e4c829dc5ca77172035f6','1f73d351eeb84ec6bb8c0b69f89ef692','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,60,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('0349c82820a34431ab64451cbf0dd7f6','1f73d351eeb84ec6bb8c0b69f89ef692','template_name','模板名称','varchar(64)','String','templateName','0','1','1','1','0','0','=','input','',NULL,20,'1','2017-06-22 16:32:56','1','2017-06-22 16:32:56',NULL,'0'),
('0383b68e195a4998a8e7c5c50e435532','21270fc4599d4586b1447ee983414574','start_data','开始日期','date','java.util.Date','startData','0','1','1','1','0','0','=','dateselect','',NULL,40,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('0512c3b27dbb4462a752853f0dde4e7e','4a5edb06bcee41b89f1f9c0826765669','description','描述','varchar(2048)','String','description','0','1','1','1','0','0','=','textarea','',NULL,80,'1','2017-06-21 10:05:23','1','2017-06-21 10:05:23',NULL,'0'),
('06725749d06b47aea7bf1d548cecd9e3','93ef5b587da7485aa048225d649eb80b','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,60,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('0826b05ad69f4baeaac93952f9f171de','9086c2a199e74a60b2ad766ea7d87637','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,170,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('0d0523c41d4e4b839c2f844c0f5baadc','93ef5b587da7485aa048225d649eb80b','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,90,'1','2017-06-22 11:13:09','1','2017-06-22 11:13:09',NULL,'0'),
('0f990476dbe34ee8b3baae36d694fed4','6eee2ea2481f44a19b76d067bdfdb18f','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,90,'1','2017-06-27 10:45:40','1','2017-06-27 10:45:40',NULL,'0'),
('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,9,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('110b10af167a4265b53463be60dee5f7','e3fad009b5264d25ad6ea4dc9234ec4b','photo','用户头像','varchar(1000)','String','photo','0','1','1','1','0','0','=','input','',NULL,120,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('13403778bb9240e39cb4b43f2d37a862','4a5edb06bcee41b89f1f9c0826765669','end_data','结束日期','date','java.util.Date','endData','0','1','1','1','0','0','=','dateselect','',NULL,70,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('13501b188e3649db9ddae9d2c6568210','9086c2a199e74a60b2ad766ea7d87637','ext_colum2','备用列2','varchar(64)','String','extColum2','0','1','1','1','0','0','=','input','',NULL,90,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('155c32d12df94a44857ec9ee17e6e9f6','e3fad009b5264d25ad6ea4dc9234ec4b','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,170,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('17be16a13a4e42498e6b8f6eb274f109','21270fc4599d4586b1447ee983414574','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,130,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('182c594f7fdc426a9192ff77d2a6c66e','21270fc4599d4586b1447ee983414574','xueli','学历','varchar(64)','String','xueli','0','1','1','1','0','0','=','input','',NULL,80,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('1936c4f2a5724a3e854736c93d102e61','e3fad009b5264d25ad6ea4dc9234ec4b','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,180,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('19ab9b558769430990bc3ba2bdc0dd0d','6eee2ea2481f44a19b76d067bdfdb18f','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,100,'1','2017-06-27 10:45:40','1','2017-06-27 10:45:40',NULL,'0'),
('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('1aedbb18ab164e11ae76095c39fbb0cd','4a5edb06bcee41b89f1f9c0826765669','corp_name','公司名称','varchar(64)','String','corpName','0','1','1','1','0','0','=','input','',NULL,30,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','=','dateselect','',NULL,7,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','String','user.id|name','0','1','1','1','1','1','=','userselect','',NULL,2,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('1e3ac411ee0f42e5add5f7ffafad9377','21270fc4599d4586b1447ee983414574','end_data','结束日期','date','java.util.Date','endData','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('1f748402a73e40c1882a2a271e5d3b6b','4a5edb06bcee41b89f1f9c0826765669','position','职位','varchar(64)','String','position','0','1','1','1','0','0','=','input','',NULL,50,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('2104ecb305c147f789bb36f3f0093f49','9086c2a199e74a60b2ad766ea7d87637','efficiency','效率数','int(11)','Integer','efficiency','0','1','1','1','0','0','=','input','',NULL,70,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('21cbba600e4d42b08b6f9b65d8a1715b','21270fc4599d4586b1447ee983414574','school_name','学校','varchar(64)','String','schoolName','0','1','1','1','0','0','=','input','',NULL,30,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('22755b61901e451bab6cada032ce6deb','9086c2a199e74a60b2ad766ea7d87637','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,150,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('227cf45c39074ce8b95d8b8d8c7073e5','4a5edb06bcee41b89f1f9c0826765669','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('240f1455e0a94f13acd43e8c06412239','93ef5b587da7485aa048225d649eb80b','staff_prop_val','员工属性值','varchar(64)','String','staffPropVal','0','1','1','1','0','0','=','input','',NULL,50,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('24b9be3f2f674ceab8f7e2fcb5a629a6','6eee2ea2481f44a19b76d067bdfdb18f','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,80,'1','2017-06-27 10:45:39','1','2017-06-27 10:45:39',NULL,'0'),
('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('2789ff8b047a46b3ab714ac18f882415','6eee2ea2481f44a19b76d067bdfdb18f','staff_prop_id','元属性id','varchar(64)','String','staffPropId','0','1','1','1','0','0','=','input','',NULL,30,'1','2017-06-27 10:45:38','1','2017-06-27 10:45:38',NULL,'0'),
('2e5725d8541f49318f6de6776f648fb5','e3fad009b5264d25ad6ea4dc9234ec4b','company_id','归属公司','varchar(64)','String','companyId','0','0','1','1','0','0','=','input','',NULL,20,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('308d21ccfb944fd7854c362d55b97134','4a5edb06bcee41b89f1f9c0826765669','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,80,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('3726b95d1aac441ab94e460d796d514d','93ef5b587da7485aa048225d649eb80b','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,80,'1','2017-06-22 11:13:09','1','2017-06-22 11:13:09',NULL,'0'),
('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,8,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('3c9a761c198740a7b458707b0990e597','93ef5b587da7485aa048225d649eb80b','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,110,'1','2017-06-22 11:13:09','1','2017-06-22 11:13:09',NULL,'0'),
('3d437cfb14e44d469d86fc6074e80b8f','e3fad009b5264d25ad6ea4dc9234ec4b','mobile','手机','varchar(200)','String','mobile','0','1','1','1','0','0','=','input','',NULL,100,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('3ede4aac307c4924b87c2ed7f1427f0b','21270fc4599d4586b1447ee983414574','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('40e44fafdcb34d7cb97107d04ef0b4aa','e3fad009b5264d25ad6ea4dc9234ec4b','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('414d9a97ca1a48d8a351da834e6d4b65','9086c2a199e74a60b2ad766ea7d87637','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,160,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('45093766fbcd49bcbfe1995f51fadbd6','e3fad009b5264d25ad6ea4dc9234ec4b','password','密码','varchar(100)','String','password','0','0','1','1','0','0','=','input','',NULL,50,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('45c0d638e8dc4473b63ac2e7b5507028','6eee2ea2481f44a19b76d067bdfdb18f','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-27 10:45:38','1','2017-06-27 10:45:38',NULL,'0'),
('45e85c6fbaa748c997fd8b9e2850ecb9','13867fd19a804587b5b67944719cac58','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,30,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input','',NULL,5,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('4a5684bcb3984f6191e8ad4502159de0','93ef5b587da7485aa048225d649eb80b','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,100,'1','2017-06-22 11:13:09','1','2017-06-22 11:13:09',NULL,'0'),
('4b6bd5a739624a62ad93654e3f292d00','21270fc4599d4586b1447ee983414574','is_tongzhao','是否统招','char(1)','String','isTongzhao','0','1','1','1','0','0','=','radiobox','',NULL,60,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4cd72e4a582c48539d6b94836b99f155','1f73d351eeb84ec6bb8c0b69f89ef692','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,70,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('4ce722e80ba64bc5b6c8e797d8adc955','6eee2ea2481f44a19b76d067bdfdb18f','template_id','模板id','varchar(64)','String','templateId','0','1','1','1','0','0','=','input','',NULL,40,'1','2017-06-27 10:45:38','1','2017-06-27 10:45:38',NULL,'0'),
('4e00fbf3588c4c569c2aae4e98a5170c','13867fd19a804587b5b67944719cac58','staff_prop_name','属性名称','varchar(64)','String','staffPropName','0','1','1','1','0','0','=','input','',NULL,20,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('50482266664a476684036bd93448a67e','4a5edb06bcee41b89f1f9c0826765669','staff_id','员工ID','varchar(64)','String','staffId','0','1','1','1','0','0','=','input','',NULL,20,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('50a4697928f14df5a6cc181d69e29f38','e3fad009b5264d25ad6ea4dc9234ec4b','login_ip','最后登陆IP','varchar(100)','String','loginIp','0','1','1','1','0','0','=','input','',NULL,130,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('539b9e4fc2294003821cae78bb0ba24f','e3fad009b5264d25ad6ea4dc9234ec4b','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,200,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,10,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input','',NULL,1,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('5e79c07e388a4c838d83b5354e37b275','9086c2a199e74a60b2ad766ea7d87637','task_count','功能数','int(11)','Integer','taskCount','0','1','1','1','0','0','=','input','',NULL,50,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('60715bf6ee404afc94626f6734fcef05','13867fd19a804587b5b67944719cac58','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,40,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('68f86f3e5e894831ab4f8986f408528c','21270fc4599d4586b1447ee983414574','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,110,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('6b33e805f45b4322b98347ecf33fd36b','21270fc4599d4586b1447ee983414574','staff_id','员工ID','varchar(64)','String','staffId','0','1','1','1','0','0','=','userselect','',NULL,20,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('6bdd636f48d24d8b9b57f0fbd9b9ff74','21270fc4599d4586b1447ee983414574','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,100,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('6bea8f845e8f4df6a93882b9b7c32320','1f73d351eeb84ec6bb8c0b69f89ef692','id','模板编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-22 16:32:56','1','2017-06-22 16:32:56',NULL,'0'),
('717f9d93a97e483ca41eb94a05fd7597','21270fc4599d4586b1447ee983414574','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,120,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','String','area.id|name','0','1','1','1','1','1','=','areaselect','',NULL,4,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('722256c2b86c44dea0b09d9372c0408f','e3fad009b5264d25ad6ea4dc9234ec4b','office_id','归属部门','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.Office','office.id|name','0','0','1','1','0','0','=','officeselect','',NULL,30,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('7a7a770415634442b793e11ab7ab15d0','9086c2a199e74a60b2ad766ea7d87637','eval_operation','评价人','varchar(64)','String','evalOperation','0','1','1','1','0','0','=','input','',NULL,100,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('7cd9e6b207164abbaa00d7b559e7c551','13867fd19a804587b5b67944719cac58','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,70,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('7fd077de17cb482aa71ac234b7eba3bd','93ef5b587da7485aa048225d649eb80b','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,70,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('8280f2eb2e3d42128f1554373f0e4e05','e3fad009b5264d25ad6ea4dc9234ec4b','user_type','用户类型','char(1)','String','userType','0','1','1','1','0','0','=','input','',NULL,110,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('82875938acbf42218d6f85b844280bbb','13867fd19a804587b5b67944719cac58','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,80,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('82aed0cd273e49fd929d1a3774ea7bdc','9086c2a199e74a60b2ad766ea7d87637','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,120,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('838833c4972449a4852323d361fe7229','9086c2a199e74a60b2ad766ea7d87637','staff_id','员工ID','varchar(64)','String','staffId','0','1','1','1','0','0','=','input','',NULL,20,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('86a6b92143c6493a8572fff2539beb2e','1f73d351eeb84ec6bb8c0b69f89ef692','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,50,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('87577e8aaecd4651973fa74b7f97156d','21270fc4599d4586b1447ee983414574','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,90,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('89b60186dfa4464e9028efdc23e4c702','e3fad009b5264d25ad6ea4dc9234ec4b','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,190,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('8b27b6647c5e4157ba7b4708635762ef','93ef5b587da7485aa048225d649eb80b','template_id','模板id','varchar(64)','String','templateId','0','1','1','1','0','0','=','input','',NULL,30,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8d88613bb573441bbfcb3c7d140a7158','13867fd19a804587b5b67944719cac58','id','属性编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,12,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('8eb1f382eef5451baf42a00dd5c82888','e3fad009b5264d25ad6ea4dc9234ec4b','login_flag','是否可登录','varchar(64)','String','loginFlag','0','1','1','1','0','0','=','input','',NULL,150,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('8fce759fbb6749e2855806170ae6f5c7','13867fd19a804587b5b67944719cac58','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,60,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('934c729d4afe4ab8a0a34ec66b42c80b','4a5edb06bcee41b89f1f9c0826765669','start_data','开始日期','date','java.util.Date','startData','0','1','1','1','0','0','=','dateselect','',NULL,60,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('936150eb7832415bb96832e452ef0a56','4a5edb06bcee41b89f1f9c0826765669','hangye','行业','varchar(64)','String','hangye','0','1','1','1','0','0','=','input','',NULL,40,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('96e779feb4cc445f8f8d321b3d600d5c','e3fad009b5264d25ad6ea4dc9234ec4b','login_name','登录名','varchar(100)','String','loginName','0','0','1','1','0','0','=','input','',NULL,40,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('9aab8aedd4574a0f9c5ce8742bfedc7e','9086c2a199e74a60b2ad766ea7d87637','eval_date','评价时间','datetime','java.util.Date','evalDate','0','1','1','1','0','0','=','dateselect','',NULL,110,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('9f80136b228948ec9b4b567223a9c4bb','e3fad009b5264d25ad6ea4dc9234ec4b','phone','电话','varchar(200)','String','phone','0','1','1','1','0','0','=','input','',NULL,90,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('a321194725224c1d9b580f91110e9a05','93ef5b587da7485aa048225d649eb80b','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('aa8b5f31666a4b71b63dc1af45cda521','9086c2a199e74a60b2ad766ea7d87637','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('ac9d797a3b3a4436b1d4301b83754129','9086c2a199e74a60b2ad766ea7d87637','bug_count','Bug数','int(11)','Integer','bugCount','0','1','1','1','0','0','=','input','',NULL,60,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','String','office.id|name','0','1','1','1','1','1','=','officeselect','',NULL,3,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('af2e1c7129df4651a1aa085de0bbbe73','e3fad009b5264d25ad6ea4dc9234ec4b','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,160,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('b14f5dc1f1f3493b9a644a70e1b8c9d6','4a5edb06bcee41b89f1f9c0826765669','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,130,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('b835742ed1d645a79cab4ff47f6a01d9','4a5edb06bcee41b89f1f9c0826765669','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,110,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('bc788e5e5a014cf89827047c0d31e950','e3fad009b5264d25ad6ea4dc9234ec4b','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,210,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('be274f7dd5514f57b9efd3f37cdec518','9086c2a199e74a60b2ad766ea7d87637','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,130,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('c312a61b2d864d53a82fbc215bb784ee','93ef5b587da7485aa048225d649eb80b','staff_prop_id','元属性id','varchar(64)','String','staffPropId','0','1','1','1','0','0','=','input','',NULL,40,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('c313a824715043ea819352fb7e2bceab','1f73d351eeb84ec6bb8c0b69f89ef692','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,80,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('c5579910bc6b4613a3435902f7868653','e3fad009b5264d25ad6ea4dc9234ec4b','name','姓名','varchar(100)','String','name','0','0','1','1','1','1','like','input','',NULL,70,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('c7ab4b70a33c4770b7a1af0f79f3c45e','4a5edb06bcee41b89f1f9c0826765669','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,90,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('c8d5f7ce9e954104977f0a45e5a64a38','21270fc4599d4586b1447ee983414574','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,140,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('d03a9721dfe74dd9b35a9525cce3e680','1f73d351eeb84ec6bb8c0b69f89ef692','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,30,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('d8cc029f3f6a473bacf71e33b78c9202','9086c2a199e74a60b2ad766ea7d87637','ext_colum1','备用列1','varchar(64)','String','extColum1','0','1','1','1','0','0','=','input','',NULL,80,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('d980410436fc46abacbe05126f355da7','4a5edb06bcee41b89f1f9c0826765669','remarks','备注信息','varchar(2048)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,120,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('dfdb765aaeec4ff4a942efa7a17c8567','9086c2a199e74a60b2ad766ea7d87637','end_data','结束日期','date','java.util.Date','endData','0','1','1','1','0','0','=','dateselect','',NULL,40,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('e0fab5e1ef62438a9712d1c97356a0c6','6eee2ea2481f44a19b76d067bdfdb18f','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,60,'1','2017-06-27 10:45:39','1','2017-06-27 10:45:39',NULL,'0'),
('e443fb35ea92422baa089edb62fae803','6eee2ea2481f44a19b76d067bdfdb18f','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,70,'1','2017-06-27 10:45:39','1','2017-06-27 10:45:39',NULL,'0'),
('e4e0d8747c1e4b8eafb470f773a00064','e3fad009b5264d25ad6ea4dc9234ec4b','email','邮箱','varchar(200)','String','email','0','1','1','1','0','0','=','input','',NULL,80,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('e4f8a0d9687a4498808529c85fcb779a','1f73d351eeb84ec6bb8c0b69f89ef692','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,40,'1','2017-06-22 16:32:57','1','2017-06-22 16:32:57',NULL,'0'),
('e5bdc144726e4404acb6acd559107a9c','9086c2a199e74a60b2ad766ea7d87637','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,140,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('e840de617fe54add95226c6a12c874c6','e3fad009b5264d25ad6ea4dc9234ec4b','no','工号','varchar(100)','String','no','0','1','1','1','0','0','=','input','',NULL,60,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0'),
('e8b26f625b4c44d791dfc9495447eaa7','9086c2a199e74a60b2ad766ea7d87637','start_data','开始日期','date','java.util.Date','startData','0','1','1','1','0','0','=','dateselect','',NULL,30,'1','2017-06-20 20:28:20','1','2017-06-20 20:28:20',NULL,'0'),
('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('e922e4012fdf4ef3b9687aa02f8eb5ca','93ef5b587da7485aa048225d649eb80b','staff_id','员工id','varchar(64)','String','staffId','0','1','1','1','0','0','=','input','',NULL,20,'1','2017-06-22 11:13:08','1','2017-06-22 11:13:08',NULL,'0'),
('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,11,'1','2013-08-12 13:10:05','1','2017-06-19 16:47:45',NULL,'0'),
('f273d891a4524c46ab79a60e3cf344f3','13867fd19a804587b5b67944719cac58','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,50,'f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57','f30fd8b8d7e24023bf37757664078a4d','2017-06-22 10:37:57',NULL,'0'),
('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('faa6e6829d374cbdb9fef94b1f6ad654','21270fc4599d4586b1447ee983414574','files','附件','varchar(2000)','String','files','0','1','1','1','0','0','=','input','',NULL,90,'1','2018-08-27 14:29:13','1','2018-08-27 14:29:13',NULL,'0'),
('fac72765adb2488583593ce4eeeeb124','21270fc4599d4586b1447ee983414574','zhuanye','专业','varchar(64)','String','zhuanye','0','1','1','1','0','0','=','input','',NULL,70,'1','2017-06-19 22:31:02','1','2018-08-27 14:29:13',NULL,'0'),
('fd9bfcbca80e48a790cbe0d22b7a19fd','6eee2ea2481f44a19b76d067bdfdb18f','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,50,'1','2017-06-27 10:45:39','1','2017-06-27 10:45:39',NULL,'0'),
('fe3e7a79ce554c2cacd8166fdf0e7f92','4a5edb06bcee41b89f1f9c0826765669','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,100,'1','2017-06-20 10:05:16','1','2017-06-21 10:05:23',NULL,'0'),
('fea768287b0b48e4a4bd489feb62042c','e3fad009b5264d25ad6ea4dc9234ec4b','login_date','最后登陆时间','datetime','java.util.Date','loginDate','0','1','1','1','0','0','=','dateselect','',NULL,140,'1','2017-06-08 13:34:31','1','2017-06-08 13:34:31',NULL,'0');

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

/*Data for the table `gen_template` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请假流程表';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('b5c22bbf5f664061b1799159e0cf4713','3','春游','春游，发布，么么哒','|/OA/userfiles/1/files/oa/notify/2017/06/chart.png|/OA/userfiles/1/files/oa/notify/2017/06/clock-select.png|/OA/userfiles/1/files/oa/notify/2017/06/tick-circle.png|/OA/userfiles/1/files/oa/notify/2017/06/add.png','1','1','2017-06-29 17:09:18','1','2017-06-29 17:09:18',NULL,'0');

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) values 
('1132d79afdd548779a932b34458b6801','b5c22bbf5f664061b1799159e0cf4713','12','0',NULL),
('1e017090d19b4e0bb51e98ce70fd86e2','b5c22bbf5f664061b1799159e0cf4713','2','0',NULL),
('25383d6ece70435a9aa4e9af9e55aa82','21183e6c5b1d4e7ebe1a9e577277779e','2','0',NULL),
('28b1457f37a54bb79a196c04341dc86f','b5c22bbf5f664061b1799159e0cf4713','3','0',NULL),
('2e566488529c423e8bba299743765ac8','21183e6c5b1d4e7ebe1a9e577277779e','6','0',NULL),
('2ff54fc75c19446d80d2920152e81ffe','21183e6c5b1d4e7ebe1a9e577277779e','13','0',NULL),
('33e94051f96a4da59700b42270b58827','b5c22bbf5f664061b1799159e0cf4713','5','0',NULL),
('3495e4d4bee64897b5dac169aec08ac4','b5c22bbf5f664061b1799159e0cf4713','4f3548c3073f4193b460947a838d74a3','0',NULL),
('4cc29487409a4bd7a2426f5591f506f7','21183e6c5b1d4e7ebe1a9e577277779e','6b3391f8104a4b94878cc6e2900d308e','0',NULL),
('4d58c4d0d6964a2c94caa054cb57dfeb','21183e6c5b1d4e7ebe1a9e577277779e','7','0',NULL),
('5727ce485db24313b7d39021a0151957','21183e6c5b1d4e7ebe1a9e577277779e','3','0',NULL),
('5ec604c4f6bc49e58f3cf6806452fe7c','b5c22bbf5f664061b1799159e0cf4713','6','0',NULL),
('654dd9d6582d4eeb872074e33a5ae4f1','b5c22bbf5f664061b1799159e0cf4713','7','0',NULL),
('66c3a86bec804688a6923dd6a727f363','21183e6c5b1d4e7ebe1a9e577277779e','12','0',NULL),
('6b6f940ef2f640cc9f2f67608710af47','b5c22bbf5f664061b1799159e0cf4713','8','0',NULL),
('6e5b24cbe8e24f35854c65cd66a63ea6','b5c22bbf5f664061b1799159e0cf4713','4','0',NULL),
('77b9b7189bcb4b3494f3fd2ba0799e94','b5c22bbf5f664061b1799159e0cf4713','6b3391f8104a4b94878cc6e2900d308e','0',NULL),
('80d55e8bd57344fbb161d6c0936aa487','b5c22bbf5f664061b1799159e0cf4713','63787492d95f496cb16b40ebd6f2e0f4','1','2017-06-29'),
('8359d65298f642f6a20874ab705ee953','21183e6c5b1d4e7ebe1a9e577277779e','f30fd8b8d7e24023bf37757664078a4d','0',NULL),
('90e95ac77c524e8e970e503400644cd9','21183e6c5b1d4e7ebe1a9e577277779e','10','0',NULL),
('a386d24a979c4f219b6d9655ad0c4fa1','b5c22bbf5f664061b1799159e0cf4713','9','0',NULL),
('a8ae6001a2ac4b9ab05bf96128a5049a','b5c22bbf5f664061b1799159e0cf4713','1','1','2017-06-29'),
('c20120efbb9d4d129c69e3b7daaba444','b5c22bbf5f664061b1799159e0cf4713','13','0',NULL),
('c235cb950b85455e8c18efca40976d79','21183e6c5b1d4e7ebe1a9e577277779e','63787492d95f496cb16b40ebd6f2e0f4','0',NULL),
('c713ef2d3db044139f932dceab2a483c','21183e6c5b1d4e7ebe1a9e577277779e','4','0',NULL),
('d6f251cf561d49d2890ab775d5025dab','21183e6c5b1d4e7ebe1a9e577277779e','5','0',NULL),
('d7971ac549d643e698563a6a720bed30','b5c22bbf5f664061b1799159e0cf4713','f30fd8b8d7e24023bf37757664078a4d','1','2017-06-30'),
('d95c4143dba14fa7b2ab0f3e17f10518','b5c22bbf5f664061b1799159e0cf4713','10','0',NULL),
('defe6b6d08974ba2a00eac6e90b2e8eb','b5c22bbf5f664061b1799159e0cf4713','11','0',NULL),
('e0c9fe56501547c9bf3108d041286e52','21183e6c5b1d4e7ebe1a9e577277779e','11','0',NULL),
('ea30ce7702d24a318cf5b20f02df8bdc','21183e6c5b1d4e7ebe1a9e577277779e','4f3548c3073f4193b460947a838d74a3','0',NULL),
('ec9f16c9b8424c328829e45dbae32466','b5c22bbf5f664061b1799159e0cf4713','935e61aa695e4e099819809c281bb2aa','0',NULL),
('ecb8c67e08e840478d04dbcd33e5dd5d','21183e6c5b1d4e7ebe1a9e577277779e','1','0',NULL),
('efb7274e52754a30b47f248d7605530d','21183e6c5b1d4e7ebe1a9e577277779e','935e61aa695e4e099819809c281bb2aa','0',NULL),
('f371b4b2427f4a2a806cffa3cdc307ea','21183e6c5b1d4e7ebe1a9e577277779e','9','0',NULL),
('f6c7b879853346cca8c0b3033a0ad82b','21183e6c5b1d4e7ebe1a9e577277779e','8','0',NULL);

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `staff_edu` */

DROP TABLE IF EXISTS `staff_edu`;

CREATE TABLE `staff_edu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `staff_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '员工ID',
  `school_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学校',
  `start_data` date DEFAULT NULL COMMENT '开始日期',
  `end_data` date DEFAULT NULL COMMENT '结束日期',
  `is_tongzhao` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否统招',
  `zhuanye` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `xueli` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_edu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工教育经历表';

/*Data for the table `staff_edu` */

insert  into `staff_edu`(`id`,`staff_id`,`school_name`,`start_data`,`end_data`,`is_tongzhao`,`zhuanye`,`xueli`,`files`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0fbeced37d024379bb110e97241d99a2','935e61aa695e4e099819809c281bb2aa','22222222','2017-07-11','2017-07-28','0','自动化','博士','|/jeesite/userfiles/1/images/staff/staffEdu/2017/07/logo.png','1','2017-07-06 15:25:09','1','2017-07-07 09:54:05',NULL,'0'),
('4276fcbcb483440f819fb28783d6feab','11','常青藤','2016-06-20','2017-06-20','0','计算机科学与技术','硕士',NULL,'1','2017-06-21 15:41:28','1','2017-06-21 15:43:15',NULL,'0'),
('591e60a734b84729ac3a9871efa02e19','f30fd8b8d7e24023bf37757664078a4d','清华大学','2012-06-20','2014-06-20','0','计算机科学与技术','本科',NULL,'1','2017-06-21 15:45:30','1','2017-06-21 15:45:30',NULL,'0'),
('6b9101f833af4a268ed424d5c0d9d8ca','f30fd8b8d7e24023bf37757664078a4d','北京大学','2007-06-06','2017-06-19','0','计算机科学与技术','硕士',NULL,'1','2017-06-19 22:57:56','1','2017-06-21 11:32:37','','0'),
('812305d80ae749d9bd299d2167d4b058','4f3548c3073f4193b460947a838d74a3','北大','2013-06-14','2017-06-28','0','计算机','本科',NULL,'f30fd8b8d7e24023bf37757664078a4d','2017-06-28 14:19:07','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 14:19:07',NULL,'0'),
('86b1324c0f3844ec8c3d102f48c351f6','f30fd8b8d7e24023bf37757664078a4d','华师一附中','2007-06-21','2012-06-21','1','高中','高中',NULL,'1','2017-06-21 21:44:35','1','2017-06-21 21:44:35',NULL,'0'),
('8e9d16578057460bbf2c35b591b68b28','935e61aa695e4e099819809c281bb2aa','',NULL,NULL,NULL,'','','','1','2017-07-06 15:39:08','1','2017-07-06 15:39:08',NULL,'1'),
('adc47b59741c48acb4af500920c01ffa','935e61aa695e4e099819809c281bb2aa','1111','2017-06-13','2021-06-09','0','1111','专科','|/OA/userfiles/f30fd8b8d7e24023bf37757664078a4d/images/staff/staffEdu/2017/07/adv-placeholder.jpg','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 17:16:49','f30fd8b8d7e24023bf37757664078a4d','2017-07-06 10:39:22',NULL,'0'),
('b709caf534e942aea8b1048c54308aa8','1','清华大学','2017-06-29','2017-06-23','0','自动化','博士',NULL,'1','2017-06-20 14:42:10','1','2017-06-21 11:31:59','','0'),
('b81e17e686174d9f891046545c6fd902','11','哈佛','2012-06-20','2016-06-20','0','心理学','本科',NULL,'1','2017-06-21 15:42:47','1','2017-06-21 15:42:47',NULL,'1'),
('c182f094854d4e00975e4fd123490a55','2','北京邮电大学','2012-06-21','2017-06-21','0','计算机科学与技术','专科',NULL,'1','2017-06-20 15:01:19','f30fd8b8d7e24023bf37757664078a4d','2017-06-21 14:44:08','','0'),
('c380ecb12e6e4086ba1047f8986f2d4a','7','中国人民大学','2017-06-30','2017-06-28','0','管理','本科',NULL,'1','2017-06-20 14:43:42','1','2017-06-21 11:31:49','','0'),
('c8f30f58fc744f7089b4cdd5da774b00','935e61aa695e4e099819809c281bb2aa','北京','2017-06-13','2017-06-20','0','111','专科',NULL,'f30fd8b8d7e24023bf37757664078a4d','2017-06-28 17:17:04','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 17:17:04',NULL,'0'),
('dcded11f1a90494495e09067a06266c9','f30fd8b8d7e24023bf37757664078a4d','长江商学院','2017-06-07','2017-06-30','1','企业管理','本科（专升本）',NULL,'1','2017-06-23 10:19:57','1','2017-06-23 10:19:57',NULL,'0'),
('ece9ca2b8375481aaad30b8301e18b95','f30fd8b8d7e24023bf37757664078a4d','中国人民大学','2012-05-30','2017-06-21','0','计算机科学与技术','博士',NULL,'1','2017-06-21 18:24:19','1','2017-06-21 18:38:27',NULL,'0');

/*Table structure for table `staff_eval` */

DROP TABLE IF EXISTS `staff_eval`;

CREATE TABLE `staff_eval` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `staff_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '员工ID',
  `eval_office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '评价时该员工所在在部门',
  `start_data` date DEFAULT NULL COMMENT '开始日期',
  `end_data` date DEFAULT NULL COMMENT '结束日期',
  `task_count` int(11) DEFAULT NULL COMMENT '工作量',
  `bug_count` int(11) DEFAULT NULL COMMENT '工作质量',
  `efficiency` int(11) DEFAULT NULL COMMENT '工作效率',
  `good` tinyint(4) DEFAULT NULL COMMENT '奖励标志，mybatis封装成boolean，0表示false，非0表示true',
  `good_explain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '奖励说明',
  `bad` tinyint(4) DEFAULT NULL COMMENT '惩罚标志，0表示false，非0表示true',
  `bad_explain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '惩罚说明',
  `eval_explain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评价说明',
  `ext_colum1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备用列1',
  `ext_colum2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备用列2',
  `ext_colum3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备用列3',
  `ext_colum4` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备用列4',
  `ext_colum5` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备用列5',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `eval_operation` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '评价人',
  `eval_date` datetime DEFAULT NULL COMMENT '评价时间',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_eval_del_flag` (`del_flag`),
  KEY `staff_id_date` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工评价信息表';

/*Data for the table `staff_eval` */

insert  into `staff_eval`(`id`,`staff_id`,`eval_office_id`,`start_data`,`end_data`,`task_count`,`bug_count`,`efficiency`,`good`,`good_explain`,`bad`,`bad_explain`,`eval_explain`,`ext_colum1`,`ext_colum2`,`ext_colum3`,`ext_colum4`,`ext_colum5`,`office_id`,`eval_operation`,`eval_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','b6e519845eb74a9d91831027d70d1359','1','2017-10-19','2017-10-15',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-23 14:11:40',NULL,'0'),
('11','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-27',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('114321311','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1154352','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('12','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('12123412423','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('123123442','b6e519845eb74a9d91831027d70d1359','1','2017-10-27','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('123241233432','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('123315442','b6e519845eb74a9d91831027d70d1359','1','2017-10-28','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('123452343','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('124122','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('12435234','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1243525','b6e519845eb74a9d91831027d70d1359','1','2017-10-06','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('124413234','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('13','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('132321','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('132412341423','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('13243123132442','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('134111','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1341326','b6e519845eb74a9d91831027d70d1359','1','2017-10-10','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14123555','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14129','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14132433','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('141344527','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1424213','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14314232','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('144124','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14535123','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('14543252','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('145652342','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('15234524','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1544132412','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('164312366','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('177412347','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('188442134188','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1c1ce6999cd14de3a80315374f598b81','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('1d629a59cd804bf0845370409ce34ef2','b6e519845eb74a9d91831027d70d1359','1','2017-10-01','2017-10-17',2,2,2,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-23 14:21:50','1','2017-10-23 14:22:04','1','2017-10-23 14:22:04',NULL,'0'),
('2','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('22312312','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('23341324421','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('234414231','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('255123131','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('34232412331','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('3441324231','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('4067b822e53b4b3d97c11902dce9f445','b6e519845eb74a9d91831027d70d1359','1','2017-10-12','2017-10-23',1,1,1,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-23 14:10:05','1','2017-10-23 14:10:24','1','2017-10-23 14:10:24',NULL,'0'),
('413418','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('4213413231','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('4234132411','b6e519845eb74a9d91831027d70d1359','1','2017-10-18','2017-10-25',1231,1,1,1,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-20 15:52:58','1','2017-10-20 15:53:11','1','2017-10-20 15:53:11',NULL,'0'),
('948229224df4409d9a989227b7dbf0e6','5e80a371890e4f84b7538eb439b8d2a1','1','2017-11-06','2017-11-13',1,1,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,'1','1','2017-11-13 16:50:24','1','2017-11-13 16:50:40','1','2017-11-13 16:50:40',NULL,'0'),
('9d7c2fecff9e4d45bf225b0412ba17b3','b6e519845eb74a9d91831027d70d1359','1','2017-10-10','2017-10-23',1231,3,1,1,'1',NULL,'','1',NULL,NULL,NULL,NULL,NULL,'1','1','2017-10-23 13:59:24','1','2017-10-23 13:59:38','1','2017-10-23 13:59:38',NULL,'0');

/*Table structure for table `staff_prop` */

DROP TABLE IF EXISTS `staff_prop`;

CREATE TABLE `staff_prop` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '属性编号',
  `staff_prop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '属性名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_prop_name_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工元属性表';

/*Data for the table `staff_prop` */

insert  into `staff_prop`(`id`,`staff_prop_name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('07107babc11348fab92521088b4fd7fc','海外工作/学习经历','1','2017-06-22 15:54:41','1','2017-06-22 15:54:41',NULL,'0'),
('1','姓名','1','2017-06-21 22:23:33','1','2017-06-21 22:23:27',NULL,'0'),
('10','证件号码','1','2017-06-22 10:26:59','1','2017-06-22 15:11:36','','0'),
('1b6084104f5145aab3dfaf3b18cdf4b7','附件','1','2017-06-29 18:09:14','1','2017-06-29 18:09:14',NULL,'0'),
('2','籍贯','1','2017-06-21 22:25:23','1','2017-06-21 22:25:29',NULL,'0'),
('3','入职时间','1','2017-06-21 22:45:35','1','2017-06-21 22:45:40',NULL,'0'),
('389ea1a4176e48e19c17dddb91575bf3','工作单位及职务','1','2017-06-28 14:24:35','1','2017-06-28 14:24:35',NULL,'0'),
('4','称谓','1','2017-06-21 22:46:47','1','2017-06-21 22:46:50',NULL,'0'),
('5','性别','1','2017-06-22 00:03:06','1','2017-06-22 00:03:11',NULL,'0'),
('6','民族','1','2017-06-22 00:04:27','1','2017-06-22 00:04:32',NULL,'0'),
('7','出生日期','1','2017-06-22 00:13:55','1','2017-06-22 00:14:00',NULL,'0'),
('70dcec8fa49d4222bc464f18d876fc6a','薪资级别','1','2017-11-13 11:27:41','1','2017-11-13 11:27:41',NULL,'0'),
('7ac9a1da850d4414b7e968ab6093141e','婚姻状况','1','2017-06-22 15:54:01','1','2017-06-22 15:54:01',NULL,'0'),
('8','参加工作年份','1','2017-06-22 00:20:57','1','2017-06-22 00:21:00',NULL,'0'),
('9','现住址','1','2017-06-22 00:29:31','1','2017-06-22 00:29:34',NULL,'0'),
('9926c6b2228644d7a702f5fd3e8ac14d','技能','1','2017-06-22 15:53:05','1','2017-06-22 15:53:05',NULL,'0'),
('9bb588b437d245878e5797f80d0de0ff','国籍','1','2017-06-22 15:53:42','1','2017-06-22 15:53:42',NULL,'0'),
('bae4d84eeb3b4850b4c61b3f50570dda','职称','1','2017-11-13 11:28:02','1','2017-11-13 11:28:02',NULL,'0'),
('be286728ebe249c498dd60666d8df66c','联系方式','1','2017-06-28 14:21:56','1','2017-06-28 14:21:56',NULL,'0'),
('e2fe5ab1925d4993a47de3721baa66b4','备注','1','2017-06-29 14:59:16','1','2017-06-29 14:59:16',NULL,'0'),
('e3d5cd72cd8f4e779992dff6b2c4a65a','b2b支付','1','2018-12-06 16:11:51','1','2018-12-06 16:11:51',NULL,'0'),
('ec938f3cd92640b49116d9cf8700b12f','政治面貌','1','2017-06-22 15:52:54','1','2017-06-22 15:52:54',NULL,'0'),
('f280a20f18044d4eba0f6ee715a5951b','入职岗位','1','2017-06-22 15:52:11','1','2017-06-22 15:52:11',NULL,'0');

/*Table structure for table `staff_prop_answer` */

DROP TABLE IF EXISTS `staff_prop_answer`;

CREATE TABLE `staff_prop_answer` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `staff_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '员工id',
  `template_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '模板id',
  `staff_prop_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '元属性id',
  `UUID` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模板批次',
  `staff_prop_val` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '员工属性值',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记，0表示正常，1表示删除',
  PRIMARY KEY (`id`),
  KEY `staff_prop_answer_name_del_flag` (`del_flag`),
  KEY `staff_id_tempalte` (`staff_id`,`del_flag`,`template_id`,`staff_prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工元属性信息表';

/*Data for the table `staff_prop_answer` */

insert  into `staff_prop_answer`(`id`,`staff_id`,`template_id`,`staff_prop_id`,`UUID`,`staff_prop_val`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0674912016854392af8962c82fff5351','f7606f6d2af8475984dcfba7d12f7650','1','9bb588b437d245878e5797f80d0de0ff','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('06bf6dc4f0354b8e8eb95346fef46ac5','b6e519845eb74a9d91831027d70d1359','1','7','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('0e7d5b5ddcfd41ddb72ac48e3123b88b','b6e519845eb74a9d91831027d70d1359','1','8','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('15adc0a03ba44761be94ca60a777a8d6','f7606f6d2af8475984dcfba7d12f7650','1','07107babc11348fab92521088b4fd7fc','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('1c8d8c1e2040482fa3c9e823526c3e7e','5e80a371890e4f84b7538eb439b8d2a1','1','6','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','1','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('1e4b3f1b1794443eb4700d37dc3d243a','b6e519845eb74a9d91831027d70d1359','1','5','02ca7581-b8e9-4687-8003-e1e4f5463cd6',NULL,'1','2017-11-13 14:25:22','1','2017-11-13 14:25:22',NULL,'0'),
('2363614d0dfa4d79b558f8f57278cbf2','5e80a371890e4f84b7538eb439b8d2a1','1','7ac9a1da850d4414b7e968ab6093141e','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('23e22e46dc4c431ea1aaafcc73565700','f7606f6d2af8475984dcfba7d12f7650','1','9','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('266ce2c689c34e20aaa8aa25f3613d2f','5e80a371890e4f84b7538eb439b8d2a1','1','9926c6b2228644d7a702f5fd3e8ac14d','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:14','1','2017-11-13 16:29:14',NULL,'0'),
('2fd863c3866a460f812e927038d29c39','f7606f6d2af8475984dcfba7d12f7650','1','7ac9a1da850d4414b7e968ab6093141e','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('323a5c22211845b0a6ee8abcc13eb736','5e80a371890e4f84b7538eb439b8d2a1','1','9','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('36f360f54a524f45bcb25e450d3aa199','bf6a767e456c4230b240a1554bb7e64a','1','bae4d84eeb3b4850b4c61b3f50570dda','843d6e64-ac3b-413b-a42c-866c81102c70','-','1','2017-11-13 17:43:11','1','2017-11-16 16:02:27',NULL,'0'),
('3c65b9233a2d4e3d898699ee38242245','5e80a371890e4f84b7538eb439b8d2a1','1','7','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('3c6f0c96fcc645839b954239166eb0e9','b6e519845eb74a9d91831027d70d1359','1','bae4d84eeb3b4850b4c61b3f50570dda','02ca7581-b8e9-4687-8003-e1e4f5463cd6','-','1','2017-11-13 15:29:19','1','2017-11-16 16:02:29',NULL,'0'),
('42902135f3894c9598f229fb8384d756','5e80a371890e4f84b7538eb439b8d2a1','1','70dcec8fa49d4222bc464f18d876fc6a','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','初级','1','2017-11-13 16:29:14','1','2017-11-16 16:02:28',NULL,'0'),
('437a33a1c9014980ae58be6058072778','5e80a371890e4f84b7538eb439b8d2a1','1','8','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('45667f5e6bf643299bf5875cde9c0409','f7606f6d2af8475984dcfba7d12f7650','1','7','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:51','1','2017-11-13 16:14:51',NULL,'0'),
('47f5c9d0da2648d897770cc24f630609','b6e519845eb74a9d91831027d70d1359','1','07107babc11348fab92521088b4fd7fc','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('4b6cbed03c0a4ba39cc37a3e0fa49551','b6e519845eb74a9d91831027d70d1359','1','70dcec8fa49d4222bc464f18d876fc6a','02ca7581-b8e9-4687-8003-e1e4f5463cd6','初级','1','2017-11-13 15:29:19','1','2017-11-16 16:02:29',NULL,'0'),
('4c9a17c0cfaa4214b1cfd0097b4d0548','5e80a371890e4f84b7538eb439b8d2a1','1','10','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('5d1c0a1cdec6499da0a25ad8cccec594','5e80a371890e4f84b7538eb439b8d2a1','1','f280a20f18044d4eba0f6ee715a5951b','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('6939711666a240d08b20bf0b269a11a9','b6e519845eb74a9d91831027d70d1359','1','9926c6b2228644d7a702f5fd3e8ac14d','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('6ba513e50edc46d087233f32728282d5','5e80a371890e4f84b7538eb439b8d2a1','1','1b6084104f5145aab3dfaf3b18cdf4b7','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:14','1','2017-11-13 16:29:14',NULL,'0'),
('6ea3014c4bc943df922327fd332d885c','5e80a371890e4f84b7538eb439b8d2a1','1','9bb588b437d245878e5797f80d0de0ff','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('72091370ab65444cbe7bfff26d32fbf4','f7606f6d2af8475984dcfba7d12f7650','1','5','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0',NULL,'1','2017-11-13 16:14:51','1','2017-11-13 16:14:51',NULL,'0'),
('77b3137ec7a14c83bd35ec6325c3489d','f7606f6d2af8475984dcfba7d12f7650','1','2','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('7a0675fc256a4c2ab5fc75de3d7553b3','5e80a371890e4f84b7538eb439b8d2a1','1','07107babc11348fab92521088b4fd7fc','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('7d00b888dc4e45d899ce69782da63511','b6e519845eb74a9d91831027d70d1359','1','10','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('7f91e4f4f3154d1a9f2cb95b62379f37','b6e519845eb74a9d91831027d70d1359','1','6','02ca7581-b8e9-4687-8003-e1e4f5463cd6','去去去','1','2017-11-13 14:25:22','1','2017-11-13 14:25:22',NULL,'0'),
('8c3c66254fe247b9b441f96eec4454bf','f7606f6d2af8475984dcfba7d12f7650','1','1b6084104f5145aab3dfaf3b18cdf4b7','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('8cd687886a9145d8945545630439a288','f7606f6d2af8475984dcfba7d12f7650','1','70dcec8fa49d4222bc464f18d876fc6a','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','高级','1','2017-11-13 16:16:14','1','2017-11-13 16:16:14',NULL,'0'),
('a64d75c465ef4a5d99783e86c4afabff','b6e519845eb74a9d91831027d70d1359','1','9','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('b622b41f24594c139293c0808dd60a3b','5e80a371890e4f84b7538eb439b8d2a1','1','5','93f70a67-8ea4-4057-a5ee-52e58f9eb82b',NULL,'1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('b7551526871246c582aaa4ad2548c843','5e80a371890e4f84b7538eb439b8d2a1','1','3','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('bd3ea378028b403093c7ef1e899d716f','b6e519845eb74a9d91831027d70d1359','1','3','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('be5eaea893bb4d56ace48a900f4f5f8b','5e80a371890e4f84b7538eb439b8d2a1','1','bae4d84eeb3b4850b4c61b3f50570dda','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','程序员 \n数据库管理工程师 \n软件工程师','1','2017-11-13 16:29:14','1','2017-11-16 16:02:29',NULL,'0'),
('bf47c543f47d421e809ba06597a6a526','b6e519845eb74a9d91831027d70d1359','1','f280a20f18044d4eba0f6ee715a5951b','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('c1dd8a0394a949428e63fb3e6a524649','f7606f6d2af8475984dcfba7d12f7650','1','9926c6b2228644d7a702f5fd3e8ac14d','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('c4522dbccf5640e29016348956d9ac27','f7606f6d2af8475984dcfba7d12f7650','1','8','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:51','1','2017-11-13 16:14:51',NULL,'0'),
('c5185d111c284e57a122277b8d17bebc','f7606f6d2af8475984dcfba7d12f7650','1','ec938f3cd92640b49116d9cf8700b12f','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('c573d8376a5f4a479138b0064a316d7b','b6e519845eb74a9d91831027d70d1359','1','1b6084104f5145aab3dfaf3b18cdf4b7','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('cb6ec581093f4ac2926ab3aee01123da','f7606f6d2af8475984dcfba7d12f7650','1','f280a20f18044d4eba0f6ee715a5951b','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('cf163dad8f4a4e21a030af905e17932f','f7606f6d2af8475984dcfba7d12f7650','1','10','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('cf3f789684f24b3b86f8e8bd6c19633c','bf6a767e456c4230b240a1554bb7e64a','1','70dcec8fa49d4222bc464f18d876fc6a','843d6e64-ac3b-413b-a42c-866c81102c70','高级','1','2017-11-13 17:43:11','1','2017-11-16 16:02:27',NULL,'0'),
('d0662aa38e5044f5a6d87c5e1dff7d00','b6e519845eb74a9d91831027d70d1359','1','ec938f3cd92640b49116d9cf8700b12f','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('d0cfd24a606a4064b4ab5bef8ca30dad','5ceddf5bae6646fa833f4b72912b1706','1','70dcec8fa49d4222bc464f18d876fc6a','4289d019-c93d-46e3-aac0-1cf78edc2470','高级','1','2017-11-13 17:50:18','1','2017-11-16 16:02:26',NULL,'0'),
('ddcb0191e75d47d69ca946f5911b3061','5ceddf5bae6646fa833f4b72912b1706','1','bae4d84eeb3b4850b4c61b3f50570dda','4289d019-c93d-46e3-aac0-1cf78edc2470','-','1','2017-11-13 17:50:18','1','2017-11-16 16:02:27',NULL,'0'),
('e8f80d84861a43629d323c2f63279f05','b6e519845eb74a9d91831027d70d1359','1','2','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('ea938c478dea4fc9b882c77a852aa59b','5e80a371890e4f84b7538eb439b8d2a1','1','2','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:13','1','2017-11-13 16:29:13',NULL,'0'),
('f424107b23934bb39db10cb70ebb5e3c','b6e519845eb74a9d91831027d70d1359','1','7ac9a1da850d4414b7e968ab6093141e','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('f548fef504484c4793a794d6dd236a7b','5e80a371890e4f84b7538eb439b8d2a1','1','ec938f3cd92640b49116d9cf8700b12f','93f70a67-8ea4-4057-a5ee-52e58f9eb82b','','1','2017-11-13 16:29:14','1','2017-11-13 16:29:14',NULL,'0'),
('fa38e08701d941b096c86609dae3b494','b6e519845eb74a9d91831027d70d1359','1','9bb588b437d245878e5797f80d0de0ff','02ca7581-b8e9-4687-8003-e1e4f5463cd6','','1','2017-11-13 14:25:23','1','2017-11-13 14:25:23',NULL,'0'),
('fa63776853474a5e9f9cee4e2e15e423','f7606f6d2af8475984dcfba7d12f7650','1','3','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','','1','2017-11-13 16:14:52','1','2017-11-13 16:14:52',NULL,'0'),
('fae7a0dd917248b38be8b5477c3352ea','f7606f6d2af8475984dcfba7d12f7650','1','bae4d84eeb3b4850b4c61b3f50570dda','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','软件工程师','1','2017-11-13 16:16:14','1','2017-11-13 16:16:14',NULL,'0'),
('fc7d30bc6753474ea44a025972a933f2','f7606f6d2af8475984dcfba7d12f7650','1','6','f73ab13d-5e1c-4d0d-8c84-9212e30a97c0','r4r4r4r4r4r','1','2017-11-13 16:14:51','1','2017-11-13 16:14:51',NULL,'0');

/*Table structure for table `staff_prop_template` */

DROP TABLE IF EXISTS `staff_prop_template`;

CREATE TABLE `staff_prop_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `template_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '模板id',
  `staff_prop_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '元属性id',
  `staff_prop_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '元属性类型',
  `staff_dict_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `sort` decimal(10,0) DEFAULT '0' COMMENT '排序字段',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_prop_template_name_del_flag` (`del_flag`),
  KEY `tempalt_id_staff_id` (`template_id`,`staff_prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工元属性模板关系表';

/*Data for the table `staff_prop_template` */

insert  into `staff_prop_template`(`id`,`template_id`,`staff_prop_id`,`staff_prop_type`,`staff_dict_type`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('01dcb45edd984d5e8ed27037fe963159','1','9926c6b2228644d7a702f5fd3e8ac14d','text','',15,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('0eddf363df78422da61a55a4864871da','1','ec938f3cd92640b49116d9cf8700b12f','text','',14,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('22f04976342340e086f379c2fe609c9e','2','e2fe5ab1925d4993a47de3721baa66b4','textarea',NULL,7,'1','2017-07-06 17:03:56','1','2017-07-06 17:03:56',NULL,'0'),
('2797bc1bd85e4c7db9ca60b0266db550','1','1b6084104f5145aab3dfaf3b18cdf4b7','images','',16,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('2cad664afc5d4288a30864c098611b82','1','9bb588b437d245878e5797f80d0de0ff','text','',12,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('33946d3575ad405b987f7d30fee9720a','1','10','text','',7,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('4863e370bbb84fa0942f5aa7a00447aa','1','6','text','',2,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('4b6679ec68754904a2f165cfb48eba02','1','07107babc11348fab92521088b4fd7fc','text','',13,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('4ca3dd8aed1b4d949737ec47649af7d7','2','7','date',NULL,3,'1','2017-07-06 17:03:56','1','2017-07-06 17:03:56',NULL,'0'),
('60e35020985945ebbab2195135e93818','1','f280a20f18044d4eba0f6ee715a5951b','text','',10,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('61f9b013ae5749678f351e1c10d4ae39','1','bae4d84eeb3b4850b4c61b3f50570dda','text','',18,'1','2018-12-06 16:12:19','1','2018-12-06 16:12:19',NULL,'0'),
('636630194a6c4566870c029ea8433c0e','1','3','date','',8,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('64196ad8586c495ca5c9e70ff7318715','1','5','radio','sex_type',1,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('657bf8d818f14e83980520aa8b98a408','2','6','text',NULL,2,'1','2017-07-06 17:03:56','1','2017-07-06 17:03:56',NULL,'0'),
('73e75449f626483e96692eac220ed982','2','be286728ebe249c498dd60666d8df66c','text',NULL,5,'1','2017-07-06 17:03:59','1','2017-07-06 17:03:59',NULL,'0'),
('75d1258e18a34d58a9ad51a5df3dbe2f','2','1','text',NULL,1,'1','2017-07-06 17:03:55','1','2017-07-06 17:03:55',NULL,'0'),
('760caf19ac60472c982d672ae253a4f1','1','2','text','',5,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('767786f1ecfb4a9aa6f8bd2534905221','c53190382aab46338fe6b6528de3ea0a','10','text',NULL,2,'1','2017-06-29 10:14:45','1','2017-06-29 10:14:45',NULL,'0'),
('7c55ba41b04a45c2b656028e2e9292aa','1','9','text','',6,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('831a7e082f224602aa4b545d8e2e88f9','1','7ac9a1da850d4414b7e968ab6093141e','text','',11,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('83632b01a7b6421db182adc349dfbdae','c53190382aab46338fe6b6528de3ea0a','1','text',NULL,1,'1','2017-06-29 10:14:45','1','2017-06-29 10:14:45',NULL,'0'),
('90e9b0f70de041a8b2e74d66f2eee0f0','1','70dcec8fa49d4222bc464f18d876fc6a','text','',17,'1','2018-12-06 16:12:19','1','2018-12-06 16:12:19',NULL,'0'),
('9b408058cef844d59a225f4eec318786','c53190382aab46338fe6b6528de3ea0a','2','text',NULL,3,'1','2017-06-29 10:14:46','1','2017-06-29 10:14:46',NULL,'0'),
('9c44c788f19748f3aabcc08d64c937ba','1','8','date','',4,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('a01f2cc3e5794ba6b17ff50143d528f6','1','7','date','',3,'1','2018-12-06 16:12:18','1','2018-12-06 16:12:18',NULL,'0'),
('a31eeeda062f4dcea61d74ef8babbd22','c53190382aab46338fe6b6528de3ea0a','389ea1a4176e48e19c17dddb91575bf3','text',NULL,5,'1','2017-06-29 10:14:46','1','2017-06-29 10:14:46',NULL,'0'),
('ac296284347543c6ad71f4c575ef70d4','2','1b6084104f5145aab3dfaf3b18cdf4b7','images',NULL,8,'1','2017-07-06 17:03:58','1','2017-07-06 17:03:58',NULL,'0'),
('cb029df3aef0416b9f288d13c4a08edc','1','e3d5cd72cd8f4e779992dff6b2c4a65a','radio','',2147483646,'1','2018-12-06 16:12:19','1','2018-12-06 16:12:19',NULL,'0'),
('db39fc93f40346209be2b6d5c20576ef','2','10','text',NULL,4,'1','2017-07-06 17:03:56','1','2017-07-06 17:03:56',NULL,'0'),
('e025ffbf989c437c9621129ddcbdf70f','c53190382aab46338fe6b6528de3ea0a','3','date',NULL,4,'1','2017-06-29 10:14:46','1','2017-06-29 10:14:46',NULL,'0'),
('f17b689e84e74475838dbc4c68830385','2','4','text',NULL,0,'1','2017-07-06 17:03:55','1','2017-07-06 17:03:55',NULL,'0'),
('f3d19dc4e39940beaa7031457f2bae39','2','2','text',NULL,6,'1','2017-07-06 17:03:56','1','2017-07-06 17:03:56',NULL,'0'),
('f42ef67539584f9da0ce4f94a649ae13','c53190382aab46338fe6b6528de3ea0a','07107babc11348fab92521088b4fd7fc','text',NULL,0,'1','2017-06-29 10:14:45','1','2017-06-29 10:14:45',NULL,'0');

/*Table structure for table `staff_role_prop` */

DROP TABLE IF EXISTS `staff_role_prop`;

CREATE TABLE `staff_role_prop` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `role_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '角色id',
  `staff_prop_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '元属性id',
  `template_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '模板id',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_role_prop_name_del_flag` (`del_flag`),
  KEY `template_id_del_role` (`template_id`,`del_flag`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工元属性模板关系表';

/*Data for the table `staff_role_prop` */

insert  into `staff_role_prop`(`id`,`role_id`,`staff_prop_id`,`template_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('003a1219af7449fc85cd86cc6a87513e','1','e2fe5ab1925d4993a47de3721baa66b4','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('1788510bf59e479bbfe96ab167fc680d','1','2','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('1e882f8e06d64cf6bf48e81e342b62a9','1','10','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('1fe32aa0d9a04814a35a9ad570dcf8ec','1','3','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('22e24ea48b8c4d329232ac770dd69a5b','1','4','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('2b492d468ffb41fba1c70653e4a77cac','1','9bb588b437d245878e5797f80d0de0ff','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('2bf073e3f88b4ba0b9969ab59beb02bb','1','be286728ebe249c498dd60666d8df66c','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('2c1942fa3cad40938af07ad84ac41dda','1','10','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('327cb80edddb47498a5fa99d7d050767','1','6','1','1','2017-11-13 11:28:44','1','2017-11-13 11:28:44',NULL,'0'),
('36984a2add984e76bbef85f48f4fdcb9','1','07107babc11348fab92521088b4fd7fc','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('3d55ef3bd7cf4973800e8989743ae754','1','6','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('45523693a7064187860be854bc87bb0f','1','f280a20f18044d4eba0f6ee715a5951b','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('7d379fd4e7bb42ad809b01604614fc0f','1','8','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('7e9630f7e8534eea8b09817dc8140f5c','1','bae4d84eeb3b4850b4c61b3f50570dda','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('9b72cdbdb45a424784687b24a78f8a53','1','3','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:02','1','2017-06-29 10:15:02',NULL,'0'),
('9eda8d76b8ca44c0b6a2af4529fcf3f0','1','1','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('a4bddef1d6a4495a87c9c2cc9164a412','1','9926c6b2228644d7a702f5fd3e8ac14d','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('a6ecf8271aef411aaa81fbc25feeedc4','1','07107babc11348fab92521088b4fd7fc','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('a6f7c26111904ba28c0a183945f1a681','1','1b6084104f5145aab3dfaf3b18cdf4b7','2','1','2017-07-06 17:10:54','1','2017-07-06 17:10:54',NULL,'0'),
('aa1f04b12b2e4a938406fc15eba46afb','1','9','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('aef0cd40aab94bd699c9954502c11d7c','1','2','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('b77a6dff74674dc283c3566995bcb814','1','70dcec8fa49d4222bc464f18d876fc6a','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('bc27d7c90cbe42e9abb3a59e5b803a2e','1','ec938f3cd92640b49116d9cf8700b12f','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('ca47959b1829476197b0f73d9b832245','1','2','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('cc3ad20bee024dc1b9eac6059ec0f39f','1','3','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('cef339f4eb024a5a887c3927f3145842','1','7','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('d3cd3b9ca67f46dab09cb59b816c3029','1','7','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('df3eaddc13a3462f8d3437fee8268483','1','10','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('dfe27d9220474da48638262eafdb8bc7','1','5','1','1','2017-11-13 11:28:44','1','2017-11-13 11:28:44',NULL,'0'),
('e58265c0dceb4e83aebbe9aa0906a858','1','1b6084104f5145aab3dfaf3b18cdf4b7','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('e5bb9da6438146bdafdb60255738d78a','1','1','2','1','2017-07-06 17:10:53','1','2017-07-06 17:10:53',NULL,'0'),
('f22df1a5a969473aa0d9c4f86de22380','1','389ea1a4176e48e19c17dddb91575bf3','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0'),
('f41bdcce2d5b40dca7f42c2bfe1b54e2','1','7ac9a1da850d4414b7e968ab6093141e','1','1','2017-11-13 11:28:45','1','2017-11-13 11:28:45',NULL,'0'),
('fc7f0065e50348719075ddacbca0406d','1','389ea1a4176e48e19c17dddb91575bf3','c53190382aab46338fe6b6528de3ea0a','1','2017-06-29 10:15:03','1','2017-06-29 10:15:03',NULL,'0');

/*Table structure for table `staff_template` */

DROP TABLE IF EXISTS `staff_template`;

CREATE TABLE `staff_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '模板编号',
  `template_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '模板名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_template_name_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工元属性模板表';

/*Data for the table `staff_template` */

insert  into `staff_template`(`id`,`template_name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','基本信息','1','2017-06-21 22:22:29','1','2017-06-21 22:24:33',NULL,'0'),
('2','家庭情况','1','2017-06-21 22:24:55','1','2017-06-21 22:25:00',NULL,'0');

/*Table structure for table `staff_work_exp` */

DROP TABLE IF EXISTS `staff_work_exp`;

CREATE TABLE `staff_work_exp` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `staff_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '员工ID',
  `corp_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `hangye` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '行业',
  `position` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `start_data` date DEFAULT NULL COMMENT '开始日期',
  `end_data` date DEFAULT NULL COMMENT '结束日期',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `description` varchar(2048) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(2048) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `staff_work_exp_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工工作经历表';

/*Data for the table `staff_work_exp` */

insert  into `staff_work_exp`(`id`,`staff_id`,`corp_name`,`hangye`,`position`,`start_data`,`end_data`,`files`,`description`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('159ae0ea21a6485383ad9116bc5c569e','f30fd8b8d7e24023bf37757664078a4d','钱先生','互联网金融','总经理','2014-06-21','2016-06-21',NULL,'规划','1','2017-06-21 17:03:47','1','2017-06-21 17:03:47',NULL,'0'),
('189ffc7496924303918e229b414e9faa','935e61aa695e4e099819809c281bb2aa','1111','111','111','2017-06-25','2017-07-11','|/OA/userfiles/1/images/staff/staffWorkExp/2017/07/2.jpg','1111','1','2017-07-03 17:02:22','1','2017-07-06 17:07:40',NULL,'0'),
('94726f5541894df3963892ef82fb2b16','11','XX软件','IT金融','Java架构师','2012-06-21','2014-06-21',NULL,'公司项目整体构建和技术选型，难点攻克等等...','1','2017-06-21 11:03:17','1','2017-06-21 11:03:17',NULL,'0'),
('b1b7ef208337407c8d9d274562330b73','935e61aa695e4e099819809c281bb2aa','4','4','4',NULL,NULL,'','4','1','2017-07-06 15:52:37','1','2017-07-06 15:52:37',NULL,'1'),
('b374335b38cf4edb815bf3524f1dd277','935e61aa695e4e099819809c281bb2aa','北京','软件','11111','2017-06-14','2017-06-30','','','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 17:18:08','f30fd8b8d7e24023bf37757664078a4d','2017-07-05 09:52:51',NULL,'0'),
('d88e6822c42d40249dd4fcad2777ec78','935e61aa695e4e099819809c281bb2aa','2222','11','111','2017-07-05','2017-07-25','|/OA/userfiles/1/images/staff/staffWorkExp/2017/07/2.jpg','','1','2017-07-06 15:30:43','1','2017-07-06 15:30:43',NULL,'0'),
('db2cfce1aeea4522b57e7d15986feb5d','4f3548c3073f4193b460947a838d74a3','XXX','XXXXX','XXXXX','2017-06-07','2017-06-30',NULL,'XXXX','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 14:19:45','f30fd8b8d7e24023bf37757664078a4d','2017-06-28 14:19:45',NULL,'0'),
('f05c19edb50347a5bc5b7048ad61a1f0','f30fd8b8d7e24023bf37757664078a4d','XX软件','电商','项目经理','2012-06-21','2013-06-21',NULL,'负责电商平台项目的整体规划，设计，运营，维护和上线等等...','1','2017-06-21 10:55:27','1','2017-06-21 11:12:47',NULL,'0'),
('fb7343bf69054472ad0cb8fc034d32a8','935e61aa695e4e099819809c281bb2aa','','','',NULL,NULL,'','','1','2017-07-06 15:39:11','1','2017-07-06 15:39:11',NULL,'1');

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','0','0,','中国',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','0,1,','北京市',20,'110000','2','1','2013-05-27 08:00:00','1','2017-06-07 20:46:49','北京市','0'),
('2ef8333c3f4648989f84a4215628d0f5','1','0,1,','上海',30,'010','2','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:02:03','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:02:03','上海','0'),
('3','2','0,1,2,','北京市',30,'110101','3','1','2013-05-27 08:00:00','1','2017-06-07 20:46:56','北京市','0'),
('4','3','0,1,2,3,','海淀区',40,'110102','4','1','2013-05-27 08:00:00','1','2017-06-07 20:47:09','海淀区','0'),
('5','3','0,1,2,3,','朝阳区',50,'110104','4','1','2013-05-27 08:00:00','1','2017-06-07 20:47:21','朝阳区','0'),
('5c30b8f1ddc74a988b8b16afebecefbf','bd39d411d84e4ed58f74b4ec97d783f2','0,1,2ef8333c3f4648989f84a4215628d0f5,bd39d411d84e4ed58f74b4ec97d783f2,','浦东区',30,'100010','1','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:04:22','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:04:50','浦东区','0'),
('6','3','0,1,2,3,','通州区',60,'110105','4','1','2013-05-27 08:00:00','1','2017-06-07 20:47:30','通州区','0'),
('9a13ff65d1df4c5bb8ed030222d1062a','bd39d411d84e4ed58f74b4ec97d783f2','0,1,2ef8333c3f4648989f84a4215628d0f5,bd39d411d84e4ed58f74b4ec97d783f2,','浦西区',30,'110011','4','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:05:16','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:05:16','浦西区','0'),
('bd39d411d84e4ed58f74b4ec97d783f2','2ef8333c3f4648989f84a4215628d0f5','0,1,2ef8333c3f4648989f84a4215628d0f5,','上海市',30,'100010','3','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:03:29','f30fd8b8d7e24023bf37757664078a4d','2017-06-13 14:03:56','上海市','0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('00a56a34389e4f22b7366549056ad283','硕士','硕士','xueli_type','学历为硕士',30,'0','1','2017-06-21 18:22:31','1','2017-06-21 18:37:14','','0'),
('04e7cd7e275f4f559daa5dc4892addd7','3','组长','sys_user_type','职务',30,'0','1','2017-07-13 15:22:12','1','2017-07-13 17:10:36','','0'),
('0db74a9121194fe1ae90f8323ac77283','专科','专科','xueli_type','学历为专科',20,'0','1','2017-06-21 18:15:17','1','2017-06-21 18:37:07','','0'),
('1','0','正常','del_flag','删除标记',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','yellow','黄色','color','颜色值',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('100','java.util.Date','Date','gen_java_type','Java类型\0\0',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('104','Custom','Custom','gen_java_type','Java类型\0\0',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('108','0','草稿','oa_notify_status','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('109','1','发布','oa_notify_status','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('11','orange','橙色','color','颜色值',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('110','0','未读','oa_notify_read','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('111','1','已读','oa_notify_read','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('12','default','默认主题','theme','主题方案',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','cerulean','天蓝主题','theme','主题方案',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','readable','橙色主题','theme','主题方案',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','united','红色主题','theme','主题方案',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','flat','Flat主题','theme','主题方案',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','1','国家','sys_area_type','区域类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','3','地市','sys_area_type','区域类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','删除','del_flag','删除标记',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','4','区县','sys_area_type','区域类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','1','公司','sys_office_type','机构类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','2','部门','sys_office_type','机构类型',70,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','3','小组','sys_office_type','机构类型',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('24','4','其它','sys_office_type','机构类型',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','1','综合部','sys_office_common','快捷通用部门',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('26','2','开发部','sys_office_common','快捷通用部门',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','3','人力部','sys_office_common','快捷通用部门',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('28','1','一级','sys_office_grade','机构等级',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('29','2','二级','sys_office_grade','机构等级',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2df9f471a85c41fd99e82ad3b08bca9f','textarea','大文本框','prop_type','属性的类型为textarea',30,'0','1','2017-06-29 14:38:52','1','2017-06-29 21:24:22','','0'),
('3','1','显示','show_hide','显示/隐藏',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('30','3','三级','sys_office_grade','机构等级',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('31','4','四级','sys_office_grade','机构等级',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('32','1','所有数据','sys_data_scope','数据范围',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('38','9','按明细设置','sys_data_scope','数据范围',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3845f672b1a34faa885082abd4702bfe','本科','本科','xueli_type','学历为本科',20,'0','1','2017-06-21 18:16:06','1','2017-06-21 18:36:54','','0'),
('39','1','系统管理','sys_user_type','职务',10,'0','1','2013-05-27 08:00:00','1','2017-07-13 17:10:13','','0'),
('4','0','隐藏','show_hide','显示/隐藏',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40','2','部门经理','sys_user_type','用户类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('41','4','组员','sys_user_type','职务',40,'0','1','2013-05-27 08:00:00','1','2017-07-13 17:10:43','','0'),
('42','basic','基础主题','cms_theme','站点主题',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('43','blue','蓝色主题','cms_theme','站点主题',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('44','red','红色主题','cms_theme','站点主题',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('45','article','文章模型','cms_module','栏目模型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('46','picture','图片模型','cms_module','栏目模型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('47','download','下载模型','cms_module','栏目模型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('48','link','链接模型','cms_module','栏目模型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('48cf798c561941b882d6d2847eec6fc7','radio','单选','prop_type','属性的类型为images',60,'0','1','2017-09-04 09:56:44','1','2017-09-04 09:56:44','','0'),
('49','special','专题模型','cms_module','栏目模型',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('5','1','是','yes_no','是/否',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('50','0','默认展现方式','cms_show_modes','展现方式',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('51','1','首栏目内容列表','cms_show_modes','展现方式',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('512fbade6a5442539e8350281381176e','0','男','sex_type','男',10,'0','1','2017-09-04 09:57:18','1','2017-09-04 09:57:18','','0'),
('52','2','栏目第一条内容','cms_show_modes','展现方式',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('53','0','发布','cms_del_flag','内容状态',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('54','1','删除','cms_del_flag','内容状态',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('55','2','审核','cms_del_flag','内容状态',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('56','1','首页焦点图','cms_posid','推荐位',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('57','2','栏目页文章推荐','cms_posid','推荐位',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('58','1','咨询','cms_guestbook','留言板分类',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('59','2','建议','cms_guestbook','留言板分类',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','0','否','yes_no','是/否',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('60','3','投诉','cms_guestbook','留言板分类',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('61','4','其它','cms_guestbook','留言板分类',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('62','1','公休','oa_leave_type','请假类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('63','2','病假','oa_leave_type','请假类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('64','3','事假','oa_leave_type','请假类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('64a6847a85f546cd8deb2399b5b01bba','text','文本框','prop_type','属性的类型为text',10,'0','1','2017-06-28 20:42:16','1','2017-06-28 20:42:16','','0'),
('65','4','调休','oa_leave_type','请假类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('66','5','婚假','oa_leave_type','请假类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('66a48f7a1517403c8cc50d10442c1d27','images','图片','prop_type','属性的类型为images',50,'0','1','2017-06-29 21:24:05','1','2017-06-29 21:24:05','','0'),
('67','1','接入日志','sys_log_type','日志类型',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('68','2','异常日志','sys_log_type','日志类型',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('69','leave','请假流程','act_type','流程类型',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('697321a493b14983a2c1db77efc11b66','大专','大专','xueli_type','学历为大专',20,'0','1','2017-06-21 21:43:27','1','2017-06-21 21:43:27','','0'),
('6eb2be760a8e42e6bc36245fb3901ffa','0','是','is_tongzhao','是否统招',10,'0','1','2017-06-19 22:51:47','1','2017-06-19 22:55:27','','0'),
('7','red','红色','color','颜色值',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('70','test_audit','审批测试流程','act_type','流程类型',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('71','1','分类1','act_category','流程分类',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('72','2','分类2','act_category','流程分类',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('73','crud','增删改查','gen_category','代码生成分类',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('75','tree','树结构','gen_category','代码生成分类',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('76','=','=','gen_query_type','查询方式',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('77','!=','!=','gen_query_type','查询方式',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('78','&gt;','&gt;','gen_query_type','查询方式',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('79','&lt;','&lt;','gen_query_type','查询方式',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('8','green','绿色','color','颜色值',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('80','between','Between','gen_query_type','查询方式',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('81','like','Like','gen_query_type','查询方式',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('82','left_like','Left Like','gen_query_type','查询方式',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('83','right_like','Right Like','gen_query_type','查询方式',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('84','input','文本框','gen_show_type','字段生成方案',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('85','textarea','文本域','gen_show_type','字段生成方案',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('86','select','下拉框','gen_show_type','字段生成方案',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('87','checkbox','复选框','gen_show_type','字段生成方案',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('88','radiobox','单选框','gen_show_type','字段生成方案',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('886743cee09b4f1bbc4addbab9e94eb1','2','项目经理','sys_user_type','职务',20,'0','1','2017-07-13 15:21:48','1','2017-07-13 17:10:24','','0'),
('89','dateselect','日期选择','gen_show_type','字段生成方案',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('9','blue','蓝色','color','颜色值',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('90','userselect','人员选择\0','gen_show_type','字段生成方案',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('90e62ddf0bab43589507cbe5e03e82a2','本科（专升本）','本科（专升本）','xueli_type','学历为本科（专升本）',50,'0','1','2017-06-23 10:18:54','1','2017-06-23 10:18:54','','0'),
('91','officeselect','部门选择','gen_show_type','字段生成方案',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('92','areaselect','区域选择','gen_show_type','字段生成方案',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('93','String','String','gen_java_type','Java类型',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('94','Long','Long','gen_java_type','Java类型',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('96','1','男','sex','性别',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
('97','2','女','sex','性别',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
('98','Integer','Integer','gen_java_type','Java类型\0\0',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('99','Double','Double','gen_java_type','Java类型\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('b908365dfb4946299795d72da97abaae','date','日期','prop_type','属性的类型为date',20,'0','1','2017-06-28 20:42:36','1','2017-06-29 21:24:33','','0'),
('bfeafb84c7484eb8bf0a1149ec106934','博士','博士','xueli_type','学历为博士',40,'0','1','2017-06-21 18:38:09','1','2017-06-21 18:38:09','','0'),
('d85d93b16a484118a6d49f99dc7fd591','files','附件','prop_type','属性的类型为files',40,'0','1','2017-06-29 18:10:25','1','2017-06-29 21:24:15','','0'),
('db3920bfedc04f2db4c2f4c915ca4109','高中','高中','xueli_type','学历为高中',10,'0','1','2017-06-21 18:15:01','1','2017-06-21 18:36:48','','0'),
('f228283493bf42f3a13552bee408ae98','1','否','is_tongzhao','是否统招',20,'0','1','2017-06-19 22:53:50','1','2017-06-21 18:12:51','','0'),
('f766c058cf4c46d3ac30d92779430ae1','1','女','sex_type','女',20,'0','1','2017-09-04 09:57:28','1','2017-09-04 09:57:28','','0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

/*Data for the table `sys_log` */

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0348371ee7ba49f39fe48858d3bb00e1','e1c8c36efcf44dfd8d789b1df46987fd','0,1,2,3,e1c8c36efcf44dfd8d789b1df46987fd,','编辑',60,'','','','0','sys:staffTemplate:edit','1','2017-06-22 17:04:04','1','2017-06-22 17:04:04','','0'),
('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑',60,'','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('0c3eed3cd6e5497087c4f13c9ba8c1a4','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','教育经历',120,'/staff/staffEdu/info','','book','1','','1','2017-06-21 14:45:40','1','2017-07-06 15:08:06','','0'),
('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构',90,'/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('0d0aa2d4e85c4de18a95b17764251227','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','基本信息',90,'/staff/staffArchives/info','','cogs','1','','1','2017-06-21 14:44:28','1','2017-07-06 15:07:51','','0'),
('1','0','0,','功能菜单',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','3','0,1,2,3,','字典管理',60,'/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','10','0,1,2,3,10,','查看',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','10','0,1,2,3,10,','修改',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','2','0,1,2,','机构用户',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','13','0,1,2,13,','区域管理',50,'/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','14','0,1,2,13,14,','查看',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','14','0,1,2,13,14,','修改',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','13','0,1,2,13,','机构管理',40,'/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','17','0,1,2,13,17,','查看',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','17','0,1,2,13,17,','修改',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('1a381f01f97b440081feb8ee1d1c096d','ba353dbb62594bd29ea27c8c3bc4693c','0,1,2,3,ba353dbb62594bd29ea27c8c3bc4693c,','查看',30,'','','','0','sys:staffProp:view','1','2017-06-22 14:59:38','1','2017-06-22 14:59:38','','0'),
('2','1','0,1,','系统设置',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','13','0,1,2,13,','用户管理',30,'/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','20','0,1,2,13,20,','查看',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','20','0,1,2,13,20,','修改',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','2','0,1,2,','关于帮助',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('24','23','0,1,2,23','官方首页',30,'http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','23','0,1,2,23','项目支持',50,'http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('26','23','0,1,2,23','论坛交流',80,'http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('27','1','0,1,','我的面板',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('28','27','0,1,27,','个人信息',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('29','28','0,1,27,28,','个人信息',30,'/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','2','0,1,2,','系统设置',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('30','28','0,1,27,28,','修改密码',40,'/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('31','1','0,1,','内容管理',500,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('32','31','0,1,31,','栏目设置',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('33','32','0,1,31,32','栏目管理',30,'/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('34','33','0,1,31,32,33,','查看',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('35','33','0,1,31,32,33,','修改',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36','32','0,1,31,32','站点设置',40,'/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('37','36','0,1,31,32,36,','查看',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('38','36','0,1,31,32,36,','修改',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('39','32','0,1,31,32','切换站点',50,'/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例',120,'','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('4','3','0,1,2,3,','菜单管理',30,'/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40','31','0,1,31,','内容管理',500,NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('41','40','0,1,31,40,','内容发布',30,'/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('42','41','0,1,31,40,41,','文章模型',40,'/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('43','42','0,1,31,40,41,42,','查看',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('43b648b2a56941ed931a1f9f531c751c','40','0,1,31,40,','员工评价',140,'/staff/staffEval/info','','thumbs-up','1','','1','2017-06-20 20:41:26','1','2017-06-20 20:53:56','','0'),
('44','42','0,1,31,40,41,42,','修改',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('44663719dce749d1903480b01fabf81e','3','0,1,2,3,','员工属性模板管理',5120,'/staff/staffPropTemplate/info','','plus-sign','1','','1','2017-06-27 15:35:07','1','2017-06-28 20:15:18','','0'),
('45','42','0,1,31,40,41,42,','审核',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('46','41','0,1,31,40,41,','链接模型',60,'/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('47','46','0,1,31,40,41,46,','查看',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('48','46','0,1,31,40,41,46,','修改',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看',30,'','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('49','46','0,1,31,40,41,46,','审核',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4917af0e814e456398ed6298bb6c4f8d','6759fcda8fca467ba1bcecd5f03e0347','0,1,2,67,6759fcda8fca467ba1bcecd5f03e0347,','编辑',60,'','','','0','staff:staffPropTemplate:edit','1','2017-06-28 15:45:40','1','2017-06-28 15:45:40','','1'),
('4a6b83e0b11e4d85a696f145b4fb62ee','43b648b2a56941ed931a1f9f531c751c','0,1,31,40,43b648b2a56941ed931a1f9f531c751c,','编辑',60,'','','','0','staff:staffEval:edit','1','2017-06-20 20:43:06','1','2017-06-20 20:43:06','','0'),
('5','4','0,1,2,3,4,','查看',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('50','40','0,1,31,40,','评论管理',40,'/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('51','50','0,1,31,40,50,','查看',30,NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('52','50','0,1,31,40,50,','审核',40,NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('53','40','0,1,31,40,','公共留言',80,'/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('54','53','0,1,31,40,53,','查看',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('55','53','0,1,31,40,53,','审核',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('56','71','0,1,27,71,','文件管理',90,'/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('57','56','0,1,27,40,56,','查看',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('58','56','0,1,27,40,56,','上传',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('59','56','0,1,27,40,56,','修改',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5c93a17792a6436ca9221b30b3b91fa4','44663719dce749d1903480b01fabf81e','0,1,2,3,44663719dce749d1903480b01fabf81e,','编辑',60,'','','','0','staff:staffPropTemplate:edit','1','2017-06-27 16:09:13','1','2017-06-28 20:16:54','','0'),
('6','4','0,1,2,3,4,','修改',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('60','31','0,1,31,','统计分析',600,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('61','60','0,1,31,60,','信息量统计',30,'/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('62','1','0,1,','在线办公',200,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('63','62','0,1,62,','个人办公',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('64','63','0,1,62,63,','请假办理',300,'/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('65','64','0,1,62,63,64,','查看',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('66','64','0,1,62,63,64,','修改',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('67','2','0,1,2,','日志查询',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('6759fcda8fca467ba1bcecd5f03e0347','67','0,1,2,67,','员工管理',70,'/staff/staffPropTemplate/info','','bell-alt','1','','1','2017-06-28 15:44:07','1','2017-06-28 15:44:07','','1'),
('68','67','0,1,2,67,','日志查询',30,'/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('69','62','0,1,62,','流程管理',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','3','0,1,2,3,','角色管理',50,'/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('70','69','0,1,62,69,','流程管理',50,'/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('71','27','0,1,27,','文件管理',90,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('72','69','0,1,62,69,','模型管理',100,'/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),
('73','63','0,1,62,63,','我的任务',50,'/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),
('74','63','0,1,62,63,','审批测试',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),
('75','1','0,1,','在线演示',3000,NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),
('79','1','0,1,','代码生成',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('8','7','0,1,2,3,7,','查看',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('80','79','0,1,79,','代码生成',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('81','80','0,1,79,80,','生成方案配置',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('82','80','0,1,79,80,','业务表配置',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('83','80','0,1,79,80,','代码模板管理',90,'/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),
('8343bef353c54367ac2c150547125c31','3','0,1,2,3,','1',5125,'/staff/staffPropTemplate/info','','bullhorn','1','','1','2017-06-28 15:40:41','1','2017-06-28 15:40:41','','1'),
('84','67','0,1,2,67,','连接池监视',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),
('85','76','0,1,75,76,','行政区域',80,'/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),
('86','75','0,1,75,','组件演示',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),
('87','86','0,1,75,86,','组件演示',30,'/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),
('88','62','0,1,62,','通知通告',20,'','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('89','88','0,1,62,88,','我的通告',30,'/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('9','7','0,1,2,3,7,','修改',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('90','88','0,1,62,88,','通告管理',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('979f93d03fea477aa266dff9faa56a01','43b648b2a56941ed931a1f9f531c751c','0,1,31,40,43b648b2a56941ed931a1f9f531c751c,','查看',30,'','','','0','staff:staffEval:view','1','2017-06-20 20:42:36','1','2017-06-20 20:42:36','','0'),
('a0345e3af92b42078f869dbcecde1166','3','0,1,2,3,','角色属性权限管理',5200,'/staff/staffRoleProp/info','','pencil','1','','1','2017-06-27 10:56:42','1','2017-06-27 23:38:07','','0'),
('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑',60,'','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('b046e6b8a5d74b748779f65b62bd263b','a0345e3af92b42078f869dbcecde1166','0,1,2,3,a0345e3af92b42078f869dbcecde1166,','查看',30,'','','','0','staff:staffRoleProp:view','1','2017-06-27 10:57:44','1','2017-06-27 10:57:44','','0'),
('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表',60,'/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('b793180d511e423d95faddebf2c8f8d4','40','0,1,31,40,','档案管理',110,'','','user-md','1','','1','2017-06-17 14:55:14','1','2017-06-21 14:50:50','','0'),
('b8bfb3676529475e9769bd630a6f7ee5','13','0,1,2,13,','档案管理',80,'/sys/staff/info','','','1','','1','2017-06-17 15:05:06','1','2017-06-17 15:05:06','','1'),
('ba353dbb62594bd29ea27c8c3bc4693c','3','0,1,2,3,','元属性配置',5030,'/sys/staffProp','','edit','1','','1','2017-06-22 14:54:01','1','2017-06-22 14:54:01','','0'),
('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表',30,'/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看',30,'','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('c375a5db7fb44110a82e98ec436ca96d','44663719dce749d1903480b01fabf81e','0,1,2,3,44663719dce749d1903480b01fabf81e,','查看',30,'','','','0','staff:staffPropTemplate:view','1','2017-06-27 16:08:41','1','2017-06-28 20:16:31','','0'),
('c6742f0928d74feda273da603eb961bb','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','查看',30,'','','','0','staff:archives:view','1','2017-06-20 16:14:16','1','2017-06-20 16:14:16','','0'),
('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑',60,'','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('d554779869fe406582a4d372b3f67089','6759fcda8fca467ba1bcecd5f03e0347','0,1,2,67,6759fcda8fca467ba1bcecd5f03e0347,','查看',30,'','','','0','staff:staffPropTemplate:view','1','2017-06-28 15:44:54','1','2017-06-28 15:44:54','','1'),
('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看',30,'','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('e1c8c36efcf44dfd8d789b1df46987fd','3','0,1,2,3,','元属性模板管理',5060,'/sys/staffTemplate','','edit','1','','1','2017-06-22 17:01:41','1','2017-06-22 17:01:41','','0'),
('e5db8ff4f5994f0c851ccd923d9faf20','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','工作经历',150,'/staff/staffWorkExp/info','','plus-sign','1','','1','2017-06-21 14:46:50','1','2017-07-06 15:08:17','','0'),
('ec0924a8402d47e8ac296a24946f1df7','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','家庭情况',180,'/staff/staffArchives/familyInfo','','th-list','1','','1','2017-06-21 14:47:26','1','2017-07-06 15:08:30','','0'),
('f1874478a87e47ae81731d59dbbc659a','e1c8c36efcf44dfd8d789b1df46987fd','0,1,2,3,e1c8c36efcf44dfd8d789b1df46987fd,','查看',30,'','','','0','sys:staffTemplate:view','1','2017-06-22 17:03:12','1','2017-06-22 17:03:12','','0'),
('f604cbbaabae4ac79c97cb52dd3c3445','b793180d511e423d95faddebf2c8f8d4','0,1,31,40,b793180d511e423d95faddebf2c8f8d4,','编辑',60,'','','','0','staff:archives:edit','1','2017-06-20 16:29:39','1','2017-06-20 16:29:39','','0'),
('fc86e13ad75f41fabf9c9b42ed6647f3','a0345e3af92b42078f869dbcecde1166','0,1,2,3,a0345e3af92b42078f869dbcecde1166,','编辑',60,'','','','0','staff:staffRoleProp:edit','1','2017-06-27 10:58:39','1','2017-06-27 10:58:39','','0'),
('ffb6754ec142423ca8f6a56609abdabd','ba353dbb62594bd29ea27c8c3bc4693c','0,1,2,3,ba353dbb62594bd29ea27c8c3bc4693c,','修改',60,'','','','0','sys:staffProp:edit','1','2017-06-22 15:00:22','1','2017-06-22 15:00:22','','0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `item_no` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`item_no`) values 
('1','0','0,','上海XX软件股份有限公司',10,'2','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:47:59','','0',NULL),
('17','7','0,1,7,','工行B2B项目组',40,'5','201010','1','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:49:10','','0',NULL),
('18','17','0,1,7,17,','开发组',10,'5','201011','2','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:50:54','','0',NULL),
('19','17','0,1,7,17,','测试组',20,'5','201012','2','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:51:04','','0',NULL),
('20','17','0,1,7,17,','需求组',30,'5','201013','2','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:51:15','','0',NULL),
('21','17','0,1,7,17,','技术组',40,'5','201014','2','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:51:22','','0',NULL),
('22','7','0,1,7,','供销电商项目组',50,'6','201010','1','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:49:34','','0',NULL),
('23','22','0,1,7,22,','开发组',10,'6','201011','2','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:51:32','','0',NULL),
('24','22','0,1,7,22,','综合部',20,'6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),
('25','22','0,1,7,22,','市场部',30,'6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),
('26','22','0,1,7,22,','技术部',40,'6','201014','3','4','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-07-13 09:50:59','','0',NULL),
('7','1','0,1,','北京分公司',20,'3','200000','1','2','','','','','','','1','','','1','2013-05-27 08:00:00','1','2017-06-07 20:48:16','','0',NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','1','系统管理员','dept','assignment','1','1','1','1','2013-05-27 08:00:00','1','2017-10-23 11:23:54','','0'),
('2','1','公司管理员','hr','assignment','2','1','1','1','2013-05-27 08:00:00','1','2017-06-20 14:52:16','','0'),
('3','1','本公司管理员','a','assignment','3','1','1','1','2013-05-27 08:00:00','1','2017-06-27 09:50:17','','0'),
('4','1','项目经理','b','assignment','4','1','1','1','2013-05-27 08:00:00','1','2017-07-13 18:05:16','','0'),
('5','1','本部门管理员','c','assignment','5','1','1','1','2013-05-27 08:00:00','1','2017-07-13 14:53:49','','0'),
('6','1','普通用户','d','user','8','1','1','1','2013-05-27 08:00:00','1','2017-07-04 14:27:00','只能查看自己的数据','0'),
('e1245dfe5ba24beda326c8e1f10bc959','1','组长','zuzhang','security-role','4','1','1','1','2017-07-13 18:04:28','1','2017-07-13 18:04:28','','0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
('1','0348371ee7ba49f39fe48858d3bb00e1'),
('1','0b2ebd4d639e4c2b83c2dd0764522f24'),
('1','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('1','0ca004d6b1bf4bcab9670a5060d82a55'),
('1','0d0aa2d4e85c4de18a95b17764251227'),
('1','1'),
('1','10'),
('1','11'),
('1','12'),
('1','13'),
('1','14'),
('1','15'),
('1','16'),
('1','17'),
('1','18'),
('1','19'),
('1','1a381f01f97b440081feb8ee1d1c096d'),
('1','2'),
('1','20'),
('1','21'),
('1','22'),
('1','23'),
('1','24'),
('1','27'),
('1','28'),
('1','29'),
('1','3'),
('1','30'),
('1','31'),
('1','32'),
('1','33'),
('1','34'),
('1','35'),
('1','36'),
('1','37'),
('1','38'),
('1','39'),
('1','3c92c17886944d0687e73e286cada573'),
('1','4'),
('1','40'),
('1','41'),
('1','42'),
('1','43'),
('1','43b648b2a56941ed931a1f9f531c751c'),
('1','44'),
('1','44663719dce749d1903480b01fabf81e'),
('1','45'),
('1','46'),
('1','47'),
('1','48'),
('1','4855cf3b25c244fb8500a380db189d97'),
('1','49'),
('1','4a6b83e0b11e4d85a696f145b4fb62ee'),
('1','5'),
('1','50'),
('1','51'),
('1','52'),
('1','53'),
('1','54'),
('1','55'),
('1','56'),
('1','57'),
('1','58'),
('1','59'),
('1','5c93a17792a6436ca9221b30b3b91fa4'),
('1','6'),
('1','60'),
('1','61'),
('1','62'),
('1','63'),
('1','64'),
('1','65'),
('1','66'),
('1','67'),
('1','68'),
('1','69'),
('1','7'),
('1','70'),
('1','71'),
('1','72'),
('1','73'),
('1','74'),
('1','79'),
('1','8'),
('1','80'),
('1','81'),
('1','82'),
('1','84'),
('1','85'),
('1','88'),
('1','89'),
('1','9'),
('1','90'),
('1','979f93d03fea477aa266dff9faa56a01'),
('1','a0345e3af92b42078f869dbcecde1166'),
('1','afab2db430e2457f9cf3a11feaa8b869'),
('1','b046e6b8a5d74b748779f65b62bd263b'),
('1','b1f6d1b86ba24365bae7fd86c5082317'),
('1','b793180d511e423d95faddebf2c8f8d4'),
('1','ba353dbb62594bd29ea27c8c3bc4693c'),
('1','ba8092291b40482db8fe7fc006ea3d76'),
('1','c2e4d9082a0b4386884a0b203afe2c5c'),
('1','c375a5db7fb44110a82e98ec436ca96d'),
('1','c6742f0928d74feda273da603eb961bb'),
('1','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
('1','df7ce823c5b24ff9bada43d992f373e2'),
('1','e1c8c36efcf44dfd8d789b1df46987fd'),
('1','e5db8ff4f5994f0c851ccd923d9faf20'),
('1','ec0924a8402d47e8ac296a24946f1df7'),
('1','f1874478a87e47ae81731d59dbbc659a'),
('1','f604cbbaabae4ac79c97cb52dd3c3445'),
('1','fc86e13ad75f41fabf9c9b42ed6647f3'),
('1','ffb6754ec142423ca8f6a56609abdabd'),
('2','1'),
('2','10'),
('2','11'),
('2','12'),
('2','13'),
('2','14'),
('2','15'),
('2','16'),
('2','17'),
('2','18'),
('2','19'),
('2','2'),
('2','20'),
('2','21'),
('2','22'),
('2','23'),
('2','24'),
('2','27'),
('2','28'),
('2','29'),
('2','3'),
('2','30'),
('2','31'),
('2','32'),
('2','33'),
('2','34'),
('2','35'),
('2','36'),
('2','37'),
('2','38'),
('2','39'),
('2','4'),
('2','40'),
('2','41'),
('2','42'),
('2','43'),
('2','44'),
('2','45'),
('2','46'),
('2','47'),
('2','48'),
('2','49'),
('2','5'),
('2','50'),
('2','51'),
('2','52'),
('2','53'),
('2','54'),
('2','55'),
('2','56'),
('2','57'),
('2','58'),
('2','59'),
('2','6'),
('2','60'),
('2','61'),
('2','62'),
('2','63'),
('2','64'),
('2','65'),
('2','66'),
('2','67'),
('2','68'),
('2','69'),
('2','7'),
('2','70'),
('2','71'),
('2','72'),
('2','73'),
('2','74'),
('2','79'),
('2','8'),
('2','80'),
('2','81'),
('2','82'),
('2','84'),
('2','85'),
('2','88'),
('2','89'),
('2','9'),
('2','90'),
('2','b793180d511e423d95faddebf2c8f8d4'),
('3','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('3','0d0aa2d4e85c4de18a95b17764251227'),
('3','1'),
('3','10'),
('3','11'),
('3','12'),
('3','13'),
('3','14'),
('3','15'),
('3','16'),
('3','17'),
('3','18'),
('3','19'),
('3','2'),
('3','20'),
('3','21'),
('3','22'),
('3','23'),
('3','24'),
('3','27'),
('3','28'),
('3','29'),
('3','3'),
('3','30'),
('3','31'),
('3','32'),
('3','33'),
('3','34'),
('3','35'),
('3','36'),
('3','37'),
('3','38'),
('3','39'),
('3','4'),
('3','40'),
('3','41'),
('3','42'),
('3','43'),
('3','43b648b2a56941ed931a1f9f531c751c'),
('3','44'),
('3','45'),
('3','46'),
('3','47'),
('3','48'),
('3','49'),
('3','4a6b83e0b11e4d85a696f145b4fb62ee'),
('3','5'),
('3','50'),
('3','51'),
('3','52'),
('3','53'),
('3','54'),
('3','55'),
('3','56'),
('3','57'),
('3','58'),
('3','59'),
('3','6'),
('3','60'),
('3','61'),
('3','62'),
('3','63'),
('3','64'),
('3','65'),
('3','66'),
('3','67'),
('3','68'),
('3','69'),
('3','7'),
('3','70'),
('3','71'),
('3','72'),
('3','73'),
('3','74'),
('3','79'),
('3','8'),
('3','80'),
('3','81'),
('3','82'),
('3','84'),
('3','85'),
('3','88'),
('3','89'),
('3','9'),
('3','90'),
('3','979f93d03fea477aa266dff9faa56a01'),
('3','b793180d511e423d95faddebf2c8f8d4'),
('3','c6742f0928d74feda273da603eb961bb'),
('3','e5db8ff4f5994f0c851ccd923d9faf20'),
('3','ec0924a8402d47e8ac296a24946f1df7'),
('3','f604cbbaabae4ac79c97cb52dd3c3445'),
('4','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('4','0d0aa2d4e85c4de18a95b17764251227'),
('4','1'),
('4','27'),
('4','28'),
('4','29'),
('4','30'),
('4','31'),
('4','40'),
('4','43b648b2a56941ed931a1f9f531c751c'),
('4','4a6b83e0b11e4d85a696f145b4fb62ee'),
('4','56'),
('4','57'),
('4','58'),
('4','59'),
('4','71'),
('4','979f93d03fea477aa266dff9faa56a01'),
('4','b793180d511e423d95faddebf2c8f8d4'),
('4','c6742f0928d74feda273da603eb961bb'),
('4','e5db8ff4f5994f0c851ccd923d9faf20'),
('4','ec0924a8402d47e8ac296a24946f1df7'),
('4','f604cbbaabae4ac79c97cb52dd3c3445'),
('5','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('5','0d0aa2d4e85c4de18a95b17764251227'),
('5','1'),
('5','27'),
('5','28'),
('5','29'),
('5','30'),
('5','31'),
('5','40'),
('5','43b648b2a56941ed931a1f9f531c751c'),
('5','4a6b83e0b11e4d85a696f145b4fb62ee'),
('5','979f93d03fea477aa266dff9faa56a01'),
('5','b793180d511e423d95faddebf2c8f8d4'),
('5','c6742f0928d74feda273da603eb961bb'),
('5','e5db8ff4f5994f0c851ccd923d9faf20'),
('5','ec0924a8402d47e8ac296a24946f1df7'),
('5','f604cbbaabae4ac79c97cb52dd3c3445'),
('6','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('6','0d0aa2d4e85c4de18a95b17764251227'),
('6','1'),
('6','10'),
('6','11'),
('6','12'),
('6','13'),
('6','14'),
('6','15'),
('6','16'),
('6','17'),
('6','18'),
('6','19'),
('6','2'),
('6','20'),
('6','21'),
('6','22'),
('6','23'),
('6','24'),
('6','27'),
('6','28'),
('6','29'),
('6','3'),
('6','30'),
('6','31'),
('6','32'),
('6','33'),
('6','34'),
('6','35'),
('6','36'),
('6','37'),
('6','38'),
('6','39'),
('6','4'),
('6','40'),
('6','43b648b2a56941ed931a1f9f531c751c'),
('6','4a6b83e0b11e4d85a696f145b4fb62ee'),
('6','5'),
('6','56'),
('6','57'),
('6','58'),
('6','59'),
('6','6'),
('6','60'),
('6','61'),
('6','62'),
('6','63'),
('6','64'),
('6','65'),
('6','66'),
('6','67'),
('6','68'),
('6','69'),
('6','7'),
('6','70'),
('6','71'),
('6','72'),
('6','73'),
('6','74'),
('6','8'),
('6','84'),
('6','88'),
('6','89'),
('6','9'),
('6','90'),
('6','979f93d03fea477aa266dff9faa56a01'),
('6','b793180d511e423d95faddebf2c8f8d4'),
('6','c6742f0928d74feda273da603eb961bb'),
('6','e5db8ff4f5994f0c851ccd923d9faf20'),
('6','ec0924a8402d47e8ac296a24946f1df7'),
('6','f604cbbaabae4ac79c97cb52dd3c3445'),
('7','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('7','0d0aa2d4e85c4de18a95b17764251227'),
('7','1'),
('7','31'),
('7','40'),
('7','43b648b2a56941ed931a1f9f531c751c'),
('7','4a6b83e0b11e4d85a696f145b4fb62ee'),
('7','979f93d03fea477aa266dff9faa56a01'),
('7','b793180d511e423d95faddebf2c8f8d4'),
('7','c6742f0928d74feda273da603eb961bb'),
('7','e5db8ff4f5994f0c851ccd923d9faf20'),
('7','ec0924a8402d47e8ac296a24946f1df7'),
('7','f604cbbaabae4ac79c97cb52dd3c3445'),
('e1245dfe5ba24beda326c8e1f10bc959','0c3eed3cd6e5497087c4f13c9ba8c1a4'),
('e1245dfe5ba24beda326c8e1f10bc959','0d0aa2d4e85c4de18a95b17764251227'),
('e1245dfe5ba24beda326c8e1f10bc959','1'),
('e1245dfe5ba24beda326c8e1f10bc959','27'),
('e1245dfe5ba24beda326c8e1f10bc959','28'),
('e1245dfe5ba24beda326c8e1f10bc959','29'),
('e1245dfe5ba24beda326c8e1f10bc959','30'),
('e1245dfe5ba24beda326c8e1f10bc959','31'),
('e1245dfe5ba24beda326c8e1f10bc959','40'),
('e1245dfe5ba24beda326c8e1f10bc959','43b648b2a56941ed931a1f9f531c751c'),
('e1245dfe5ba24beda326c8e1f10bc959','4a6b83e0b11e4d85a696f145b4fb62ee'),
('e1245dfe5ba24beda326c8e1f10bc959','56'),
('e1245dfe5ba24beda326c8e1f10bc959','57'),
('e1245dfe5ba24beda326c8e1f10bc959','58'),
('e1245dfe5ba24beda326c8e1f10bc959','59'),
('e1245dfe5ba24beda326c8e1f10bc959','71'),
('e1245dfe5ba24beda326c8e1f10bc959','979f93d03fea477aa266dff9faa56a01'),
('e1245dfe5ba24beda326c8e1f10bc959','b793180d511e423d95faddebf2c8f8d4'),
('e1245dfe5ba24beda326c8e1f10bc959','c6742f0928d74feda273da603eb961bb'),
('e1245dfe5ba24beda326c8e1f10bc959','e5db8ff4f5994f0c851ccd923d9faf20'),
('e1245dfe5ba24beda326c8e1f10bc959','ec0924a8402d47e8ac296a24946f1df7'),
('e1245dfe5ba24beda326c8e1f10bc959','f604cbbaabae4ac79c97cb52dd3c3445');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values 
('7','10'),
('7','11'),
('7','12'),
('7','13'),
('7','14'),
('7','15'),
('7','16'),
('7','17'),
('7','18'),
('7','19'),
('7','20'),
('7','21'),
('7','22'),
('7','23'),
('7','24'),
('7','25'),
('7','26'),
('7','7'),
('7','8'),
('7','9');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '职务',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `leave_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '离职标记',
  `leave_date` date DEFAULT NULL COMMENT '离职时间',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`),
  KEY `leave_flag` (`leave_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`leave_flag`,`leave_date`) values 
('1','1','1','thinkgem','0fc9a4a631604e3970fcc64c2ae25a1b92e3b038dc00269b6ae9f3fc','0001','系统管理员','thinkgem@163.com','8675','13521072352','','','0:0:0:0:0:0:0:1','2019-10-27 13:36:26','1','1','2017-07-13 16:11:16','1','2017-11-13 11:22:18','','0','0',NULL),
('5ceddf5bae6646fa833f4b72912b1706','1','1','33','dd42589c2190eb0f341969a17fb1b3c2f6793d88f1bfe1a8762d1aea','121313','肖斌','','','18710002554','','',NULL,NULL,'1','1','2017-11-13 17:50:00','1','2017-11-13 17:50:00','','0','0',NULL),
('5e80a371890e4f84b7538eb439b8d2a1','1','1','11','e736b24500d91bc486469f50b2a99ea40c83fa57c801618273318c94','dfa','郭亦凡','','','13521072352','','','127.0.0.1','2017-11-13 16:33:24','1','1','2017-11-13 16:28:34','1','2017-11-13 16:33:16','','0','0',NULL),
('87ba62f453444dac8efd123094a5d920','1','22','003','5473bac6ef756583e1dc612f67fd5ac9cd3925071bd4ecec65a092b2','003','003','','','','2','','127.0.0.1','2017-07-13 18:06:39','1','1','2017-07-13 16:11:16','1','2017-07-13 18:06:24','','0','1','2017-09-21'),
('b6e519845eb74a9d91831027d70d1359','1','1','liuji','0fc9a4a631604e3970fcc64c2ae25a1b92e3b038dc00269b6ae9f3fc','0002','刘吉','thinkgem@163.com','8675','8675','4',NULL,'127.0.0.1','2017-11-13 16:32:36','1','1','2017-07-13 15:49:05','1','2017-07-13 15:49:05','','0','0',NULL),
('bf6a767e456c4230b240a1554bb7e64a','1','1','22','24409a6c792766223bb873072dab3e46f1bf838eb86bcea7549733ae','1231','张雷','','','18710002554','','',NULL,NULL,'1','1','2017-11-13 17:16:36','1','2017-11-13 17:16:36','','0','0',NULL),
('ead622f9d7de4f498af40d17c0f8d684','1','22','1去','b493f4779047d816a0a1e8f696ed25326e1ad8e20f76fb0b03e311af','123','1去','','','15718861395','','',NULL,NULL,'1','1','2017-11-13 11:21:04','1','2017-11-13 11:34:24','','0','0',NULL),
('f7606f6d2af8475984dcfba7d12f7650','1','17','2去','ea832ff1b053c6443f124d044387591953a16dbe2487ef2287784327','3423','2去','','','15718861395','','',NULL,NULL,'1','1','2017-11-13 11:21:29','1','2017-11-13 11:34:31','','0','0',NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('1','6'),
('1','e1245dfe5ba24beda326c8e1f10bc959'),
('4902e61c99264374982bb1f6f112887c','1'),
('5ceddf5bae6646fa833f4b72912b1706','2'),
('5e80a371890e4f84b7538eb439b8d2a1','4'),
('87ba62f453444dac8efd123094a5d920','1'),
('b6e519845eb74a9d91831027d70d1359','1'),
('bf6a767e456c4230b240a1554bb7e64a','6'),
('ead622f9d7de4f498af40d17c0f8d684','4'),
('f7606f6d2af8475984dcfba7d12f7650','e1245dfe5ba24beda326c8e1f10bc959');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

/*Data for the table `test_data` */

insert  into `test_data`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('a190ba98736244d1992496d667a8a2af','f30fd8b8d7e24023bf37757664078a4d','','','',NULL,NULL,'1','2017-06-19 11:29:24','1','2017-06-19 11:29:24','','1');

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

/*Data for the table `test_data_main` */

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

/*Data for the table `test_tree` */

insert  into `test_tree`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('02f2bd29bf9e4e189a4eaa8b0964c365','69688a9398cb4748bc1420fe3dcffce3','0,69688a9398cb4748bc1420fe3dcffce3,','姓名',30,'1','2017-06-21 13:52:35','1','2017-06-21 13:53:56','','0'),
('4588862ef59e4dc2a8eafb60cacf5b2a','b50f84b0d2d149518b38ed43b7d4acce','0,69688a9398cb4748bc1420fe3dcffce3,b50f84b0d2d149518b38ed43b7d4acce,','查看',30,'1','2017-06-21 13:55:37','1','2017-06-21 13:55:37','','0'),
('5fdf534da413403aba4655753ac68b04','02f2bd29bf9e4e189a4eaa8b0964c365','0,69688a9398cb4748bc1420fe3dcffce3,02f2bd29bf9e4e189a4eaa8b0964c365,','修改',60,'1','2017-06-21 13:54:53','1','2017-06-21 13:54:53','','0'),
('69688a9398cb4748bc1420fe3dcffce3','0','0,','员工基本信息',30,'1','2017-06-21 13:52:28','1','2017-06-21 13:53:39','','0'),
('98634b131966418fb544a039155fbe3a','b50f84b0d2d149518b38ed43b7d4acce','0,69688a9398cb4748bc1420fe3dcffce3,b50f84b0d2d149518b38ed43b7d4acce,','修改',60,'1','2017-06-21 13:55:44','1','2017-06-21 13:55:44','','0'),
('b50f84b0d2d149518b38ed43b7d4acce','69688a9398cb4748bc1420fe3dcffce3','0,69688a9398cb4748bc1420fe3dcffce3,','身份证号',60,'1','2017-06-21 13:55:24','1','2017-06-21 13:55:24','','0'),
('b83c357989ab431583d86e242c85f645','02f2bd29bf9e4e189a4eaa8b0964c365','0,69688a9398cb4748bc1420fe3dcffce3,02f2bd29bf9e4e189a4eaa8b0964c365,','查看',30,'1','2017-06-21 13:54:44','1','2017-06-21 13:54:44','','0'),
('c518f82708cc46d4b0981c4a3603a6cd','0','0,','家庭情况',30,'1','2017-06-21 13:54:19','1','2017-06-21 13:54:19','','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
