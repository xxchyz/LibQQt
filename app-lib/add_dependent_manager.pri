#----------------------------------------------------------------
#add_dependent_manager.pri
#这个文件用于给用户提供内置的通常需要的library、defines、config等等。
#和同目录下add_library_XXX.pri共同拷贝使用，这些作为Multi-link原生支持的Library链接帮助存在
#用户可以在add_custom_manager.pri里自助添加。
#不拷贝也可以使用。
#----------------------------------------------------------------
THIS_PRI_PWD = $${PWD}

############################################################################################################
#对产品线的控制结构Multi-link下命令 开启产品线
############################################################################################################
#管理内置依赖的函数
#用户可以依照模板增加内置依赖，这样使用更方便。

#################################################################
##此处代码完成包含(链接+发布)libQQt的函数
#include(add_library_QQt.pri)
#add_dependent
##这里是对QQt的lib的支持。
##这个支持是有条件的：如果用户移动了Multi-link技术文件夹，那么不再自动加入支持，用户需要手动include(add_library_QQt.pri)，和使用其他的lib一样。
##这个支持有个特点，因为LibQQt是开源的，所以这个pri依赖了qqt_header.pri，所以这个pri不能移动，一旦移动就会失去效果。
#如此支持。使用函数
#后续会脱离qqt_header.pri
#################################################################
defineTest(add_dependent_manager_QQt){
    !equals(TARGET_PRIVATE, QQt):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_QQt.pri) {
        include ($${THIS_PRI_PWD}/../app-lib/add_library_QQt.pri)
        contains(TEMPLATE, app):add_dependent_library_QQt()
        else:contains(TEMPLATE, lib):add_link_library_QQt()
        else:add_link_library_QQt()
    }
    return (1)
}

defineTest(add_dependent_manager_Qwt){
    !equals(TARGET_PRIVATE, Qwt):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_Qwt.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_Qwt.pri)
        contains(TEMPLATE, app):add_dependent_library_Qwt()
        else:contains(TEMPLATE, lib):add_link_library_Qwt()
        else:add_link_library_Qwt()
    }
    return (1)
}

defineTest(add_dependent_manager_QwtPlot3d){
    !equals(TARGET_PRIVATE, QwtPlot3d):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_QwtPlot3d.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_QwtPlot3d.pri)
        contains(TEMPLATE, app):add_dependent_library_QwtPlot3d()
        else:contains(TEMPLATE, lib):add_link_library_QwtPlot3d()
        else:add_link_library_QwtPlot3d()
    }
    return (1)
}

defineTest(add_dependent_manager_OpenCV){
    !equals(TARGET_PRIVATE, OpenCV):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_OpenCV.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_OpenCV.pri)
        contains(TEMPLATE, app):add_dependent_library_OpenCV()
        else:contains(TEMPLATE, lib):add_link_library_OpenCV()
        else:add_link_library_OpenCV()
    }
    return (1)
}

defineTest(add_dependent_manager_OpenSceneGraph){
    !equals(TARGET_PRIVATE, OpenSceneGraph):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_OpenSceneGraph.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_OpenSceneGraph.pri)
        contains(TEMPLATE, app):add_dependent_library_OpenSceneGraph()
        else:contains(TEMPLATE, lib):add_link_library_OpenSceneGraph()
        else:add_link_library_OpenSceneGraph()
    }
    return (1)
}

#这个是模板
defineTest(add_dependent_manager_Template){
    !equals(TARGET_PRIVATE, Template):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_Template.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_Template.pri)
        contains(TEMPLATE, app):add_dependent_library_Template()
        else:contains(TEMPLATE, lib):add_link_library_Template()
        else:add_link_library_Template()
    }
    return (1)
}

defineTest(add_dependent_manager_GoogleTest){
    !equals(TARGET_PRIVATE, GoogleTest):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_GoogleTest.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_GoogleTest.pri)
        contains(TEMPLATE, app):add_dependent_library_GoogleTest()
        else:contains(TEMPLATE, lib):add_link_library_GoogleTest()
        else:add_link_library_GoogleTest()
    }
    return (1)
}

defineTest(add_dependent_manager_log4cpp){
    !equals(TARGET_PRIVATE, log4cpp):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_log4cpp.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_log4cpp.pri)
        contains(TEMPLATE, app):add_dependent_library_log4cpp()
        else:contains(TEMPLATE, lib):add_link_library_log4cpp()
        else:add_link_library_log4cpp()
    }
    return (1)
}

defineTest(add_dependent_manager_FMOD){
    !equals(TARGET_PRIVATE, FMOD):
        exists($${THIS_PRI_PWD}/../app-lib/add_library_FMOD.pri){
        include ($${THIS_PRI_PWD}/../app-lib/add_library_FMOD.pri)
        contains(TEMPLATE, app):add_dependent_library_FMOD()
        else:contains(TEMPLATE, lib):add_link_library_FMOD()
        else:add_link_library_FMOD()
    }
    return (1)
}

#################################################################
#这是一个强大的函数
#调用这一个函数就可以调用上边实现的函数
#################################################################
defineTest(add_dependent_manager){
    libname = $$1
    isEmpty(1):libname = QQt
    add_dependent_manager_$${libname}()
    return (1)
}